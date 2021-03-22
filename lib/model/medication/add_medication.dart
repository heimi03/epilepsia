import 'dart:convert';

import 'package:flutter/material.dart';


class Medication {
  String name;
  String dosis;
  String icon;
  String farbe;

  Medication({this.name, this.dosis, this.icon, this.farbe});

  factory Medication.fromJson(Map<String, dynamic> data) {
    return Medication(
      name: data['name'],
      dosis: data['dosis'],
      icon: data['icon'],
      farbe: data['farbe'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'dosis': dosis, 'icon': icon, 'farbe': farbe};
  }
}
