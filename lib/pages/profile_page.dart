import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/utilizador.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/repositories/rides_repositores.dart';
import 'package:flutter_application_1/pages/historic_page.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:provider/src/provider.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late RidesRepository rides;

  logout() async {
    try {
      await context.read<AuthService>().logout();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: 45,
                  ),
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                    border: Border.all(color: Colors.grey),
                    image: DecorationImage(
                      image: NetworkImage(rides.utilizador.profilePicture),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Olá, ${rides.utilizador.name}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/home');
                            logout();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )),
                  ],
                ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "E-mail: ${rides.utilizador.email}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 2.2,
                    ),
                  ),
                  Text(
                    "Telemóvel: ${rides.utilizador.phone}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 2.2,
                    ),
                  ),
                  Text(
                    "Instituto: ${rides.utilizador.university}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 2.2,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),
              Container(
                height: 40,
                width: 220,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoricPage()),
                    );
                  },
                  child: const Text(
                    "HISTÓRICO",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    primary: Colors.black,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 220,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "EDITAR DADOS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    primary: Colors.black,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 220,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "MUDAR PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    primary: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
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
              onPressed: () {},
              icon: const Icon(Icons.person),
              iconSize: 40,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
