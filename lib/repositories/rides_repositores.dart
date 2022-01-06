import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/controller/db.dart';
import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/utilizador.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class RidesRepository extends ChangeNotifier {
  final List<Ride> _rides = [];
  User? user = AuthService().usuario;
  final Utilizador _user = Utilizador(
      name: "Henrique",
      profilePicture: "https://avatars.githubusercontent.com/u/68897798?v=4",
      email: "henrique",
      phone: "987876543",
      university: "Ipmaia");

  UnmodifiableListView<Ride> get rides => UnmodifiableListView(_rides);

  @override
  get utilizador => this._user;

  void addRide({required Ride ride}) async {
    FirebaseFirestore db = await DBFirestore.get();
    await db.collection("rides").add({
      'date': ride.date.toString(),
      'destiny': ride.destiny.toString(),
      'numberseat': ride.numberSeat.toString(),
      'origin': ride.meetingPoint.toString(),
      'userdriver': user!.uid,
    });
    _rides.add(ride);
    notifyListeners();
  }

  SelectUser(User? user) async {
    FirebaseFirestore db = await DBFirestore.get();
    DocumentSnapshot sp = await db.collection('users').doc(user!.uid).get();
    //_user?.email = sp.get('name').toString();
    //_user?.phone = sp.get('phone').toString();
    //_user?.name = sp.get('name');
    //_user?.university = sp.get('university').toString();
    //_user?.profilePicture =
    // "https://avatars.githubusercontent.com/u/68897798?v=4";
  }

  _readRides() async {
    FirebaseFirestore db = await DBFirestore.get();
    final snapshot = await db.collection('rides').get();
    //SelectUser(user);
    //Utilizador driver = _user!;
    snapshot.docs.forEach((doc) {
      Ride ride = Ride(
        date: doc.get('date'),
        meetingPoint: doc.get('origin'),
        destiny: doc.get('destiny'),
        numberSeat: doc.get('numberseat'),
        driver: _user,
      );
      _rides.add(ride);
      notifyListeners();
    });
  }

  RidesRepository() {
    _readRides();
  }
}
