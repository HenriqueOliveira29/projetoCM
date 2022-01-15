import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/repositories/rides_repositores.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class HistoricPage extends StatefulWidget {
  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  late RidesRepository rides;

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
      body: ListView.separated(
        itemBuilder: (BuildContext context, int i) {
          final List<Ride> tabela = rides.rides.toList();
          return ListTile(
            leading: Image.asset(
                (tabela[i].driver.name == rides.utilizador.name)
                    ? 'images/arrow_green.png'
                    : 'images/arrow_red.png'),
            title: Text('Ponto de encontro: ' +
                tabela[i].meetingPoint +
                '\nDestino: ' +
                tabela[i].destiny +
                '\nData e hora: ' +
                tabela[i].date.toString()),
            trailing: Image.network(tabela[i].driver.profilePicture),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        padding: const EdgeInsets.all(16),
        itemCount: rides.rides.length,
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
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
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
