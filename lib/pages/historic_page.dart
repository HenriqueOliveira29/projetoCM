import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/repositories/rides_repositores.dart';
import 'package:flutter_application_1/pages/profile_page.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class HistoricPage extends StatelessWidget {
  var controller = RidesRepository();

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
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int i) {
          final List<Ride> rides = controller.rides;
          return ListTile(
            leading: Image.asset(
                (rides[i].driver.name == controller.utilizador.name)
                    ? 'images/arrow_green.png'
                    : 'images/arrow_red.png'),
            title: Text('Ponto de encontro: ' +
                rides[i].meetingPoint +
                '\nDestino: ' +
                rides[i].destiny +
                '\nData e hora: ' +
                rides[i].date),
            trailing: Image.network(rides[i].driver.profilePicture),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        padding: const EdgeInsets.all(16),
        itemCount: controller.rides.length,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              icon: const Icon(Icons.person),
              iconSize: 40,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
