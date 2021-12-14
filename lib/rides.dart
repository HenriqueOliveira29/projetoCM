import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  Rides extends StatelessWidget {
  const Rides({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  new EdgeInsets.symmetric(horizontal:20, vertical: 20),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 200,
            alignment: Alignment.center,
            child: Column(
              children: [
              Container(
                  width: 34.0,
                  height: 34.0,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: Image.asset("images/me.jpg"),
              ),
              ),
              Text("Henrique")
            ],),
          )
      ],),
    );
  }
}