// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:epilepsia/model/healthy/stimmung.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

// class Terminmodel {
//   String userid;
//   String name;
//   DateTime tagesauswahl;
//   TimeOfDay von;
//   TimeOfDay bis;
//   StatusIcons farbe;


//   Terminmodel({this.userid, this.name, this.tagesauswahl, this.von, this.bis, this.farbe});

//   factory Terminmodel.fromJson(Map<String, dynamic> data) {
//     DateTime dateTime = DateTime.parse(data['tagesauswahl']);
//     var vonUhrzeit = data["von"];
//     var bisUhrzeit = data["bis"];
//     return Terminmodel(
//       userid: data['id'],
//       name: data['name'],
//       tagesauswahl: dateTime,
//       farbe: StatusIcons.fromJson(data['farbe']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     Map _farbe = this.farbe != null ? this.farbe.toJson() : null;
//     return {
//       'id': userid,
//       'name': name,
//       'tagesauswahl': tagesauswahl.toIso8601String(),
//       'vonUhrzeit': von.toString(),
//       'bisUhrzeit': bis.toString(),
//       'farbe': _farbe,
      
      
//     };
//   }
// }

// getDataFromDatabase() async {
//   var value = FirebaseDatabase.instance.reference();
//   var getValue = await value.child('termin').once();
//   return getValue;
// }

//   Future<CalendarDataSource> getTerminData()async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     var result;
//     // List<CalendarDataSource> list = <Terminmodel>[];

//     result = await firestore
//         .collection("termin")
//         .get();

//     result.docs.forEach((result) {
//       var data = result.data();
//       Terminmodel termin = new Terminmodel.fromJson(data);
    
//       //list.add(termin);

//     });
//     return result;
//   }