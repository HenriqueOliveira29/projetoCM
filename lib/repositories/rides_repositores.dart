import 'dart:collection';

import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/utilizador.dart';

class RidesRepository extends ChangeNotifier {
  final List<Ride> _rides = [];
  Utilizador _user = Utilizador(
      name: "Henrique",
      phone: "987654321",
      profilePicture: "https://avatars.githubusercontent.com/u/68897798?v=4",
      email: "henrique.olive29@gmail.com",
      university: "IPMAIA");

  UnmodifiableListView<Ride> get rides => UnmodifiableListView(this._rides);

  get utilizador => this._user;

  void addRide({required Ride ride}) {
    _rides.add(ride);
    notifyListeners();
  }

  RidesRepository() {
    _rides.addAll([
      Ride(
          destiny: "IPMAIA",
          meetingPoint: "Valongo",
          driver: Utilizador(
              name: "Henrique",
              phone: "987654321",
              profilePicture:
                  "https://avatars.githubusercontent.com/u/68897798?v=4",
              email: "henrique.olive29@gmail.com",
              university: "IPMAIA"),
          date: "12/10/2021",
          numberSeat: "3"),
      Ride(
          destiny: "IPMAIA",
          meetingPoint: "Valongo",
          driver: Utilizador(
              name: "Diogo",
              phone: "123456789",
              profilePicture:
                  "https://avatars.githubusercontent.com/u/68897798?v=4",
              email: "henrique.olive29@gmail.com",
              university: "Coimbra"),
          date: "12/10/2021",
          numberSeat: "1"),
      Ride(
          destiny: "IPMAIA",
          meetingPoint: "Valongo",
          driver: Utilizador(
              name: "Azevedo",
              phone: "98761234",
              profilePicture:
                  "https://avatars.githubusercontent.com/u/68897798?v=4",
              email: "henrique.olive29@gmail.com",
              university: "IPMAIA"),
          date: "12/10/2021",
          numberSeat: "3"),
      Ride(
          destiny: "IPMAIA",
          meetingPoint: "Valongo",
          driver: Utilizador(
              name: "Henrique",
              phone: "987654321",
              profilePicture:
                  "https://avatars.githubusercontent.com/u/68897798?v=4",
              email: "henrique.olive29@gmail.com",
              university: "IPMAIA"),
          date: "12/10/2021",
          numberSeat: "3"),
      Ride(
          destiny: "IPMAIA",
          meetingPoint: "Valongo",
          driver: Utilizador(
              name: "Henrique",
              phone: "987654321",
              profilePicture:
                  "https://avatars.githubusercontent.com/u/68897798?v=4",
              email: "henrique.olive29@gmail.com",
              university: "IPMAIA"),
          date: "12/10/2021",
          numberSeat: "3"),
    ]);
  }
}
