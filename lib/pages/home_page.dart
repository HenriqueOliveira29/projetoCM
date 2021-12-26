import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/create_drive.dart';
import 'package:flutter_application_1/pages/home_controller.dart';
import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter_application_1/pages/ride_info.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
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
            )),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int i) {
              final List<Ride> tabela = controller.tabela;
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
                            image: NetworkImage(
                                "https://avatars.githubusercontent.com/u/68897798?v=4"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Text(tabela[i].nomeCondutor)
                  ],
                ),
                title: Text("Destino: ${tabela[i].destino}"),
                subtitle: Text("Origem: ${tabela[i].origem}"),
                trailing: Text("Data: ${tabela[i].data}"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => RideInfo(
                            ride: tabela[i]),
                      )
                  );
                },
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: controller.tabela.length),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createdrives');
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
                onPressed: () {
                 
                },
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
          )),
        ));
  }
}
