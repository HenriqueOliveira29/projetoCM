import 'dart:collection';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/controller/db.dart';
import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/utilizador.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/widgets/auth_check.dart';
import 'package:provider/provider.dart';

class RidesRepository extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final List<Ride> _rides = [];
  late User? user;
  late Utilizador _user = Utilizador(
      name: "",
      profilePicture: "https://avatars.githubusercontent.com/u/68897798?v=4",
      email: user!.email.toString(),
      phone: "",
      university: "");

  UnmodifiableListView<Ride> get rides => UnmodifiableListView(_rides);

  @override
  get utilizador => this._user;

  _getUser() async {
    user = _auth.currentUser;
    await SelectUtilizador(user!.uid);
    notifyListeners();
  }

  SelectUtilizador(String uid) async {
    FirebaseFirestore db = await DBFirestore.get();
    DocumentSnapshot sp =
        await db.collection('users').doc(uid.toString()).get();
    _user.name = sp['name'].toString();
    _user.profilePicture =
        "https://avatars.githubusercontent.com/u/68897798?v=4";
    _user.email = sp['email'].toString();
    _user.phone = sp['phone'].toString();
    _user.university = sp['university'].toString();
  }

  void addRide({required Ride ride}) async {
    FirebaseFirestore db = await DBFirestore.get();
    await _getUser();
    await db.collection("rides").add({
      'date': (ride.date),
      'destiny': ride.destiny.toString(),
      'numberseat': ride.numberSeat.toString(),
      'origin': ride.meetingPoint.toString(),
      'passenger': ride.passeger,
      'userdriver': user!.uid,
    });
    _rides.add(ride);
    notifyListeners();
  }

  Future<Utilizador> SelectUser(String uid) async {
    FirebaseFirestore db = await DBFirestore.get();
    DocumentSnapshot sp =
        await db.collection('users').doc(uid.toString()).get();
    return Utilizador(
        name: sp['name'].toString(),
        profilePicture: "https://avatars.githubusercontent.com/u/68897798?v=4",
        email: sp['email'].toString(),
        phone: sp['phone'].toString(),
        university: sp['university'].toString());
  }

  _readRides() async {
    FirebaseFirestore db = await DBFirestore.get();
    final snapshot = await db.collection('rides').get();
    print(snapshot.docs.length);
    await _getUser();
    //Utilizador driver = _user!;
    snapshot.docs.forEach((doc) async {
      Ride ride = Ride(
          id: doc.id,
          date: doc.get('date'),
          meetingPoint: doc.get('origin'),
          destiny: doc.get('destiny'),
          numberSeat: doc.get('numberseat'),
          driver: await SelectUser(doc.get('userdriver').toString()),
          passeger: doc.get('passenger'));
      if (Timestamp.now().compareTo(ride.date) < 0) {
        _rides.add(ride);
        notifyListeners();
      }
    });
  }

  insertPassenger(String uidpassenger, Ride ride) async {
    FirebaseFirestore db = await DBFirestore.get();
    final snapshot1 = await db.collection('rides').doc(ride.id).get();

    List<dynamic> passengerclone = [];
    passengerclone = snapshot1.get('passenger');
    if (int.parse(ride.numberSeat) < passengerclone.length ||
        !passengerclone.contains(uidpassenger)) {
      passengerclone.add(uidpassenger.toString());
      final snapshot = await db
          .collection('rides')
          .doc(ride.id)
          .update({'passenger': passengerclone});
    }

    notifyListeners();
  }

  List<Ride> SearchRide(String destiny, String origin) {
    List<Ride> results = [];
    _rides.forEach((element) {
      if (element.destiny.toString() == destiny &&
          element.meetingPoint.toString() == origin) {
        results.add(element);
      }
    });
    return results;
  }

  RidesRepository() {
    _readRides();
  }
}
