import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rides extends StatelessWidget {
  const Rides({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.grey)),
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    margin:
                        new EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                image: ExactAssetImage('images/me.jpg'),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          child: Text("Henrique"),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                          child: Text("Origem: Valongo "),
                          margin: new EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                        ),
                        Container(
                          child: Text("Destino: IPMAIA"),
                          margin: new EdgeInsets.symmetric(
                              horizontal: 30, vertical: 5),
                        ),
                      ]),
                      Container(child: Text("Data/Hora: 12/12/2021 07:00")),
                      Container(
                          child: Text(
                        "Lugares vagos: 3",
                        textAlign: TextAlign.end,
                      ))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
