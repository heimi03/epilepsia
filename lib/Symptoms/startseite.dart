import 'package:epilepsia/config/farben.dart';
import 'package:flutter/material.dart';

class Startseite extends StatefulWidget {
  @override
  _StartseiteState createState() => _StartseiteState();
}

class _StartseiteState extends State<Startseite> {
  final timeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    timeController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    readOnly: true,
                    controller: timeController,
                    decoration: InputDecoration(
                        hoverColor: Colors.blue[200],
                        hintText: 'Zeitpunkt auswählen'),
                    onTap: () async {
                      var time = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
                      timeController.text = time.format(context);
                    },
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Stimmung: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      boxWidget(
                          'Glücklich',
                          Icon(
                            Icons.sentiment_very_satisfied,
                            size: 30,
                          ),
                          Colors.cyan[400],
                          null),
                      boxWidget(
                          'Neutral',
                          Icon(
                            Icons.sentiment_neutral,
                            size: 30,
                          ),
                          Colors.cyan[400],
                          null),
                      boxWidget(
                          'Traurig',
                          Icon(
                            Icons.sentiment_dissatisfied,
                            size: 30,
                          ),
                          Colors.cyan[400],
                          null),
                      boxWidget(
                          'Gereizt',
                          Icon(
                            Icons.sentiment_very_dissatisfied,
                            size: 30,
                          ),
                          Colors.cyan[400],
                          null),
                    ],
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Symptome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      boxWidget(
                          'Zucken',
                          Icon(
                            Icons.bolt,
                            size: 30,
                          ),
                          Colors.lightBlue[200],
                          null),
                      boxWidget(
                          'Bewusstlos',
                          Icon(
                            Icons.snooze,
                            size: 30,
                          ),
                          Colors.lightBlue[200],
                          null),
                      boxWidget(
                          'Krämpfe',
                          Icon(
                            Icons.warning,
                            size: 30,
                          ),
                          Colors.lightBlue[200],
                          null),
                      boxWidget(
                          'Fieber',
                          Icon(
                            Icons.thermostat_outlined,
                            size: 30,
                          ),
                          Colors.lightBlue[200],
                          null),
                    ],
                  ),
                  Divider(
                    height: 40,
                    thickness: 3,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Stress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      boxWidget(
                          'Entspannt',
                          Icon(
                            Icons.wb_sunny,
                            size: 30,
                          ),
                          Colors.indigo[200],
                          null),
                      boxWidget(
                          'Unruhe',
                          Icon(
                            Icons.wb_cloudy,
                            size: 30,
                          ),
                          Colors.indigo[200],
                          null),
                      boxWidget(
                          'Anspannung',
                          Icon(
                            Icons.bolt,
                            size: 30,
                          ),
                          Colors.indigo[200],
                          null),
                      boxWidget(
                          'Stress',
                          Icon(
                            Icons.flash_on,
                            size: 30,
                          ),
                          Colors.indigo[200],
                          null),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Respond to button press
                    },
                    icon: Icon(Icons.add, size: 18),
                    label: Text("Hinzufügen"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[800],
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                    ),
                  )
                ],
              ))),
    );
  }
}

Widget boxWidget(String text, Icon icon, Color color, String string) {
  bool _hasBeenPressed = false;
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
      height: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: icon,
              //color: _iconcolor,
              onPressed: () {
                //setState(() {
                //_iconcolor = Colors.green;
           //},)           
                //functionToDatabase(string);
              },
            ),
          ),

          
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    ),
  );
}

void functionToDatabase(String string) {
  //if(time!=null){
  print(string);
  //}else{
  //  showDialog(context: context);
  //}
}
