import 'package:epilepsia/config/router.dart';
import 'package:epilepsia/Home/diary.dart';
import 'package:epilepsia/Medication/medication.dart';
import 'package:epilepsia/Symptoms/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:epilepsia/config/farben.dart';
import 'package:table_calendar/table_calendar.dart';


class Home extends StatefulWidget {
   Home({Key key,}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}




class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(bottom: 10),
    color: Colors.blueGrey[50],
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 5, left: 10),
          ),
        Row(
          children: [
            Expanded(
              child: Container(
              
                margin:
                    EdgeInsets.only(top: 60, bottom: 5, left: 10, right: 10),
                height: 100,
                child: TextButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.eco,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Gesundheit",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, routeSymptoms);
                  },
                ),
                color: Colors.indigo[200],
              ),
            ),
                        Expanded(
              child: Container(
                margin:
                    EdgeInsets.only(top: 60, bottom: 5, left: 10, right: 10),
                height: 100,
                child: TextButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.av_timer,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Tagesablauf",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, routeDaily);
                  },
                ),
                color: Colors.blueGrey[200],
              ),
            ),
            Expanded(
              child: Container(
                margin:
                    EdgeInsets.only(top: 60, bottom: 5, left: 10, right: 10),
                height: 100,
                child: TextButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.medical_services_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Medikation",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, routeMedication);
                  },
                ),
                color: Colors.blue[100],
              ),
            ),
          ],
        ),
      ],
    ),
);
  }
}