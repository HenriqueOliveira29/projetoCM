import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter_application_1/pages/ride_info.dart';
import 'package:flutter_application_1/repositories/rides_repositores.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
  late RidesRepository rides;
}

class SearchState extends State<Search> {
  late RidesRepository rides;

  final _destiny = TextEditingController();
  final _origin = TextEditingController();
  List<Ride>? searchride;
  @override
  Widget build(BuildContext context) {
    rides = Provider.of<RidesRepository>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Center(
          child: Image.asset(
            'images/logoUniRides.png',
            fit: BoxFit.contain,
            height: 50,
          ),
        ),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: TextFormField(
                controller: _origin,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Origem',
                    labelText: "Origem"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira a origem';
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: TextFormField(
                controller: _destiny,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Destino',
                    labelText: "Destino"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira a destino';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    searchride = rides.SearchRide(_destiny.text, _origin.text);
                  });
                },
                child: const Text(
                  "Pesquisar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(18),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  primary: Colors.black,
                ),
              ),
            ),
            (searchride != null)
                ? Expanded(
                    child: Container(
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int i) {
                          return ListTile(
                            leading: Column(
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50.0)),
                                      border: Border.all(color: Colors.grey),
                                      image: DecorationImage(
                                        image: NetworkImage(searchride![i]
                                            .driver
                                            .profilePicture),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Text(searchride![i].driver.name)
                              ],
                            ),
                            title: Text("Destino: ${searchride![i].destiny}"),
                            subtitle:
                                Text("Origem: ${searchride![i].meetingPoint}"),
                            trailing: Text(DateFormat("'Data:' dd/MM/yyy")
                                .format(searchride![i].date.toDate())),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        RideInfo(ride: searchride![i]),
                                  ));
                            },
                          );
                        },
                        separatorBuilder: (_, __) => Divider(),
                        itemCount: searchride!.length),
                  ))
                : Container(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
              iconSize: 40,
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: 40,
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
              iconSize: 40,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
