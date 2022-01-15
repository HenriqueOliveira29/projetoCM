import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/utilizador.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/repositories/rides_repositores.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CreateDrive extends StatefulWidget {
  @override
  State<CreateDrive> createState() => _CreateDriveState();
}

class _CreateDriveState extends State<CreateDrive> {
  final _destino = TextEditingController();
  final _origem = TextEditingController();
  final _data = TextEditingController();
  final _nlugares = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late RidesRepository repository;
  late User utilizador;

  @override
  Widget build(BuildContext context) {
    repository = Provider.of<RidesRepository>(context);
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                        margin: new EdgeInsets.symmetric(vertical: 30),
                        child: Title(
                          color: Colors.black,
                          child: Text(
                            "Adicionar boleia",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        )),
                    Container(
                      child: TextFormField(
                        controller: _destino,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            hintText: 'Destino',
                            labelText: "Destino"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira o destino';
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: TextFormField(
                        controller: _origem,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
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
                      margin: EdgeInsets.only(top: 15),
                      child: TextFormField(
                        controller: _data,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            hintText: 'Data',
                            labelText: "Data"),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira a Data';
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: TextFormField(
                        controller: _nlugares,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            hintText: 'Numero de lugares',
                            labelText: "Numero de lugares"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira o numero de lugares';
                          }
                        },
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 200,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            DateFormat inputformat =
                                DateFormat('dd-MM-yyy hh:mm');
                            DateTime dataride = inputformat.parse(_data.text);
                            List<String> array = [];
                            repository.addRide(
                                ride: Ride(
                                    id: "",
                                    date: Timestamp.fromDate(dataride),
                                    destiny: _destino.text.toString(),
                                    meetingPoint: _origem.text.toString(),
                                    numberSeat: _nlugares.text.toString(),
                                    driver: repository.utilizador,
                                    passeger: array));

                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "Criar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            primary: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
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
