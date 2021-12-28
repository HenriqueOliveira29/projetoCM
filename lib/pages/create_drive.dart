import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/models/ride.dart';

class CreateDrive extends StatelessWidget {
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
        body: SingleChildScrollView(
          child: Container(
            child: Center(
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          hintText: 'Ponto de Encontro',
                          labelText: "Ponto de Encontro"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        hintText: 'Destino',
                        labelText: 'Destino',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        hintText: 'Data',
                        labelText: 'Data',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          hintText: 'N lugares',
                          labelText: 'N lugares'),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 200,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {},
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
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: (Row(
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
