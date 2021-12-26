import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/rides_repositores.dart';

class HomeController {
  late RidesRepository ridesRepository;

  List<Ride> get tabela => ridesRepository.rides;

  HomeController(){
    ridesRepository = RidesRepository();
  }
}
