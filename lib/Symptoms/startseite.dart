import 'package:epilepsia/config/farben.dart';
import 'package:epilepsia/model/healthy/status.dart';
import 'package:epilepsia/model/healthy/stimmung.dart';
import 'package:epilepsia/model/healthy/symptome.dart';
import 'package:epilepsia/widget.dart';
import 'package:flutter/material.dart';

class Startseite extends StatefulWidget {
  const Startseite({Key key}) : super(key: key);
  @override
  _StartseiteState createState() => _StartseiteState();
}

class _StartseiteState extends State<Startseite> {
  final timeController = TextEditingController();

  List<StatusIcons> statusList = <StatusIcons>[];

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
                      StatusWidget(
                        widget.key,
                        'stimmung',
                        'Glücklich',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stimmung',
                        'Neutral',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stimmung',
                        'Traurig',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stimmung',
                        'Gereizt',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      // Widget1(
                      //     widget.key,
                      //     'Neutral',
                      //     Icon(
                      //       Icons.sentiment_neutral,
                      //       size: 30,
                      //     ),
                      //     Colors.cyan[400],
                      //     null),
                      // Widget1(
                      //     widget.key,
                      //     'Traurig',
                      //     Icon(
                      //       Icons.sentiment_dissatisfied,
                      //       size: 30,
                      //     ),
                      //     Colors.cyan[400],
                      //     null),
                      // Widget1(
                      //     widget.key,
                      //     'Gereizt',
                      //     Icon(
                      //       Icons.sentiment_very_dissatisfied,
                      //       size: 30,
                      //     ),
                      //     Colors.cyan[400],
                      //     null),
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
                      StatusWidget(
                        widget.key,
                        'symptome',
                        'testS',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'symptome',
                        'Neutral',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'symptome',
                        'Traurig',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'symptome',
                        'Gereizt',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      // Widget1(
                      //     widget.key,
                      //     'Zucken',
                      //     Icon(
                      //       Icons.bolt,
                      //       size: 30,
                      //     ),
                      //     Colors.lightBlue[200],
                      //     null),
                      // Widget1(
                      //     widget.key,
                      //     'Bewusstlos',
                      //     Icon(
                      //       Icons.snooze,
                      //       size: 30,
                      //     ),
                      //     Colors.lightBlue[200],
                      //     null),
                      // Widget1(
                      //     widget.key,
                      //     'Krämpfe',
                      //     Icon(
                      //       Icons.warning,
                      //       size: 30,
                      //     ),
                      //     Colors.lightBlue[200],
                      //     null),
                      // Widget1(
                      //     widget.key,
                      //     'Fieber',
                      //     Icon(
                      //       Icons.thermostat_outlined,
                      //       size: 30,
                      //     ),
                      //     Colors.lightBlue[200],
                      //     null),
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
                      StatusWidget(
                        widget.key,
                        'stress',
                        'test',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stress',
                        'Neutral',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stress',
                        'Traurig',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stress',
                        'Gereizt',
                        61668,
                        Colors.cyan[400],
                        statusList,
                      ),
                      // Widget1(
                      //     widget.key,
                      //     'Entspannt',
                      //     Icon(
                      //       Icons.wb_sunny,
                      //       size: 30,
                      //     ),
                      //     Colors.indigo[200],
                      //     null),
                      // Widget1(
                      //     widget.key,
                      //     'Unruhe',
                      //     Icon(
                      //       Icons.wb_cloudy,
                      //       size: 30,
                      //     ),
                      //     Colors.indigo[200],
                      //     null),
                      // Widget1(
                      //     widget.key,
                      //     'Anspannung',
                      //     Icon(
                      //       Icons.bolt,
                      //       size: 30,
                      //     ),
                      //     Colors.indigo[200],
                      //     null),
                      // Widget1(
                      //     widget.key,
                      //     'Stress',
                      //     Icon(
                      //       Icons.flash_on,
                      //       size: 30,
                      //     ),
                      //     Colors.indigo[200],
                      //     null),
                    ],
                  ),
                  Visibility(
                    visible: true,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print(statusList);
                        saveStatus(statusList);
                      },
                      icon: Icon(Icons.add, size: 18),
                      label: Text("Hinzufügen"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[800],
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                      ),
                    ),
                  )
                ],
              ))),
    );
  }

  void saveStatus(List<StatusIcons> statusList) {
    StatusIcons stimmung =
        statusList.firstWhere((element) => element.id == "stimmung");
        StatusIcons symptome =
        statusList.firstWhere((element) => element.id == "symptome");
        StatusIcons stress =
        statusList.firstWhere((element) => element.id == "stress");
    Status status = new Status(id: null, stimmung: stimmung, symptome: symptome, stress: stress);
    print(status.toJson());
  }
}

Widget boxWidget(String text, Icon icon, Color color, String string) {
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
              onPressed: () {
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
