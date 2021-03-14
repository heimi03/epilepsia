import 'dart:convert';

import 'package:flutter/material.dart';

Future<List<Medication>> fetchPhotos(icon_pfad) async {
  final response = await icon_pfad.get(Uri.parse('assets/image/pill.png'));

  // Use the compute function to run parsePhotos in a separate isolate.
  //return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Medication> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Medication>((json) => Medication.fromJson(json)).toList();
}

class Medication {
  String name;
  String dosis;
  String icon_pfad;
  String farbe;

  Medication({this.name, this.dosis, this.icon_pfad, this.farbe});

  factory Medication.fromJson(Map<String, dynamic> data) {
    return Medication(
      name: data['name'],
      dosis: data['dosis'],
      icon_pfad: data['icon_pfad'],
      farbe: data['farbe'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'dosis': dosis, 'icon': icon_pfad, 'farbe': farbe};
  }
}
