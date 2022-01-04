import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/utilizador.dart';

class Ride {
  String destiny;
  String meetingPoint;
  String date;
  Utilizador driver;
  String numberSeat;

  Ride(
      {required this.destiny,
      required this.meetingPoint,
      required this.driver,
      required this.date,
      required this.numberSeat});
}
