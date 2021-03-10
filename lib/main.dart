import 'package:epilepsia/Home/calendar.dart';
import 'package:epilepsia/Daily/daily.dart';
import 'package:epilepsia/Home/diary.dart';
import 'package:epilepsia/Home/home.dart';
import 'package:epilepsia/Medication/medication.dart';
import 'package:epilepsia/Home/settings.dart';
import 'package:epilepsia/Symptoms/symptoms.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:epilepsia/config/farben.dart';

import 'config/router.dart';


void main() {
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'epilepsia',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,       // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      onGenerateRoute: Router.generateRoute,
      initialRoute: routeHome,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

int _selectedIndex = 0;
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
final List<Widget> _widgetOptions = <Widget>[
  Home(),
  Calendar(),
  Diary(),
  Settings(),
];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: _widgetOptions[_selectedIndex],
    


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
          color: Colors.black),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today,
          color: Colors.black),
          label: 'Kalender',
        ),
        BottomNavigationBarItem
        (
          icon: Icon(Icons.book,
          color: Colors.black),
          label: 'Tagebuch',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined,
          color: Colors.black,
          ),
          label: 'Einstellungen',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    ),
    );
  }
}
