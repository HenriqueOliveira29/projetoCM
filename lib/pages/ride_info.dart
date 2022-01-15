import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/repositories/rides_repositores.dart';
import 'package:provider/provider.dart';
import '../models/ride.dart';
import 'package:intl/intl.dart';

class RideInfo extends StatefulWidget {
  Ride? ride;
  RideInfo({Key? key, this.ride, user}) : super(key: key);

  @override
  State<RideInfo> createState() => _RideInfoState();
}

class _RideInfoState extends State<RideInfo> {
  late RidesRepository rides;
  @override
  Widget build(BuildContext context) {
    rides = Provider.of<RidesRepository>(context);
    var number =
        int.parse(widget.ride!.numberSeat) - widget.ride!.passeger.length;
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
        body: Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Detalhes da Boleia',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  height: 150.0,
                  width: double.maxFinite,
                  color: Colors.grey[350],
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      DateFormat.yMd()
                          .add_jm()
                          .format(widget.ride!.date.toDate()),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                            'Origem: ${widget.ride!.meetingPoint.toString()}',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18)),
                      ),
                      Text('Destino: ${widget.ride!.destiny.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18))
                    ],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black38)),
                  width: double.maxFinite,
                  height: 90,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: NetworkImage(
                                  widget.ride!.driver.profilePicture),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.ride!.driver.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            Text(
                              'Contactar ${widget.ride!.driver.phone}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    '${number} lugares vagos',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                (widget.ride!.driver.email == rides.user!.email)
                    ? Container()
                    : Container(
                        height: 40,
                        width: 200,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: (widget.ride!.passeger.length <
                                int.parse(widget.ride!.numberSeat))
                            ? ElevatedButton(
                                onPressed: () {
                                  rides.insertPassenger(
                                      rides.user!.uid, widget.ride!);
                                },
                                child: Text(
                                  'RESERVAR',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    primary: Colors.black),
                              )
                            : Container(
                                child: Text("Lugares ocupados"),
                              ),
                      )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: (Row(
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
          )),
        ));
  }
}
