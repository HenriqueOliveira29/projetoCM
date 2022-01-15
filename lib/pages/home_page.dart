import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/create_drive.dart';
import 'package:flutter_application_1/pages/home_controller.dart';
import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/ride_info.dart';
import 'package:flutter_application_1/repositories/rides_repositores.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RidesRepository rides;

  @override
  Widget build(BuildContext context) {
    rides = Provider.of<RidesRepository>(context);
    //rides = context.watch<RidesRepository>();

    return Scaffold(
        appBar: AppBar(
            //automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            title: Center(
              child: Image.asset(
                'images/logoUniRides.png',
                fit: BoxFit.contain,
                height: 50,
              ),
            )),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int i) {
              final List<Ride> tabela = rides.rides.toList();
              return ListTile(
                leading: Column(
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(color: Colors.grey),
                          image: DecorationImage(
                            image:
                                NetworkImage(tabela[i].driver.profilePicture),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Text(tabela[i].driver.name)
                  ],
                ),
                title: Text("Destino: ${tabela[i].destiny}"),
                subtitle: Text("Origem: ${tabela[i].meetingPoint}"),
                trailing: Text(DateFormat("'Data:' dd/MM/yyy")
                    .format(tabela[i].date.toDate())),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RideInfo(ride: tabela[i]),
                      ));
                },
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: rides.rides.length),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createdrive');
              },
              icon: Icon(Icons.add)),
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: (Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
                iconSize: 40,
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pesquisar');
                },
                icon: const Icon(Icons.search),
                iconSize: 40,
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(Icons.person),
                iconSize: 40,
                color: Colors.white,
              ),
            ],
          )),
        ));
  }
}
