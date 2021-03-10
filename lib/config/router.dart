import 'package:epilepsia/Daily/daily.dart';
import 'package:epilepsia/Home/home.dart';
import 'package:epilepsia/Medication/medication.dart';
import 'package:epilepsia/Symptoms/symptoms.dart';
import 'package:flutter/material.dart';

const String routeHome = '/';
const String routeSymptoms = '/symptoms';
const String routeDaily = '/daily';
const String routeMedication = '/medication';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => Home());
      case routeMedication:
        return MaterialPageRoute(builder: (_) => Medication());
      case routeDaily:
        return MaterialPageRoute(builder: (_) => Daily());
      case routeSymptoms:
        return MaterialPageRoute(builder: (_) => Symptoms());
        


    default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
  }
  }
}