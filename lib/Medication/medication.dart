import 'package:epilepsia/Medication/add_medication.dart';
import 'package:epilepsia/Medication/plan_medication.dart';
import 'package:epilepsia/config/router.dart';
import 'package:flutter/material.dart';

import '../config/farben.dart';

class Medication extends StatefulWidget {
   Medication({Key key,}) : super(key: key);
  @override
  _MedicationState createState() => _MedicationState();
}



class _MedicationState extends State<Medication> {
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
  length: 2,
  child: Scaffold(
    appBar: AppBar(
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.white,
        tabs: [
          Tab(icon: Icon(Icons.medical_services), text: 'Medikament hinzufügen',),
          Tab(icon: Icon(Icons.medical_services_sharp), text: 'Arzneimittelplan',),
         
        ],
      ),
    ),
  body: TabBarView(
           children:[
             AddMedication(),
             PlanMedication(), ]
 
  ),
),
          );
   
  }
}