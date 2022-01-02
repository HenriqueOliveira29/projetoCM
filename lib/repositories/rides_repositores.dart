import 'package:flutter_application_1/models/ride.dart';
import 'package:flutter/material.dart';

class RidesRepository {
  final List<Ride> _rides = [];

  get rides => this._rides;

  void addRide({required Ride ride}) {
    this._rides.add(ride);
  }

  RidesRepository() {
    _rides.addAll([
      Ride(
        destino: "IPMAIA",
        origem: "Valongo",
        nomeCondutor: "Antonio",
        data: "12/10/2021",
        foto: "https://avatars.githubusercontent.com/u/68897798?v=4",
      ),
      Ride(
        destino: "Universidade Catolica",
        origem: "Gondomar",
        nomeCondutor: "Luis",
        data: "12/10/2021",
        foto: "https://avatars.githubusercontent.com/u/68897798?v=4",
      ),
      Ride(
          destino: "Universidade do Porto",
          origem: "Rio Tinto",
          nomeCondutor: "Andre",
          data: "12/10/2021",
          foto: "https://avatars.githubusercontent.com/u/68897798?v=4"),
      Ride(
        destino: "Universidade de Felgueiras",
        origem: "Valongo",
        nomeCondutor: "Sandra",
        data: "12/10/2021",
        foto: "https://avatars.githubusercontent.com/u/68897798?v=4",
      ),
      Ride(
        destino: "IPMAIA",
        origem: "Vila do Conde",
        nomeCondutor: "Goncalo",
        data: "12/10/2021",
        foto: "https://avatars.githubusercontent.com/u/68897798?v=4",
      ),
    ]);
  }
}
