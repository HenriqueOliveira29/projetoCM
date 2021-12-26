import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/ride.dart';

class Rides extends StatelessWidget {
  Ride? ride;
  Rides({Key? key, this.ride}) : super(key: key);

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
                                image: ExactAssetImage("https://avatars.githubusercontent.com/u/68897798?v=4"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          child: Text(ride!.nomeCondutor),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                          child: Text(ride!.origem.toString()),
                          margin: new EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                        ),
                        Container(
                          child: Text(ride!.destino.toString()),
                          margin: new EdgeInsets.symmetric(
                              horizontal: 30, vertical: 5),
                        ),
                      ]),
                      Container(child: Text("Data/Hora: ${ride!.data.toString()}")),
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
