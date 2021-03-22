import 'package:epilepsia/Home/calendar.dart';
import 'package:epilepsia/Daily/daily.dart';
import 'package:epilepsia/Home/diary.dart';
import 'package:epilepsia/Home/home.dart';
import 'package:epilepsia/Medication/medication.dart';
import 'package:epilepsia/Home/settings.dart';
import 'package:epilepsia/Symptoms/symptoms.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:epilepsia/config/farben.dart';
import 'config/router.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'epilepsia',
      theme: ThemeData(
        
        primarySwatch: Colors.blueGrey,
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
