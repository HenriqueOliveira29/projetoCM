import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/utilizador.dart';

class Ride {
  String id;
  String destiny;
  String meetingPoint;
  Timestamp date;
  Utilizador driver;
  String numberSeat;
  List<dynamic> passeger;

  Ride(
      {required this.id,
      required this.destiny,
      required this.meetingPoint,
      required this.driver,
      required this.date,
      required this.numberSeat,
      required this.passeger});
}
