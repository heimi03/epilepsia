import 'package:epilepsia/config/farben.dart';
import 'package:epilepsia/model/healthy/status.dart';
import 'package:epilepsia/model/healthy/stimmung.dart';
import 'package:epilepsia/model/healthy/symptome.dart';
import 'package:epilepsia/config/widget/widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
final timeController = TextEditingController();
final dateController = TextEditingController();

class Startseite extends StatefulWidget {
  const Startseite({Key key}) : super(key: key);
  @override
  _StartseiteState createState() => _StartseiteState();
}

class _StartseiteState extends State<Startseite> {
  List<StatusIcons> statusList = <StatusIcons>[];

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    timeController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    DateFormat format = DateFormat('dd.MM.yyyy');
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: TextField(
                      readOnly: true,
                      controller: dateController,
                      decoration: InputDecoration(
                          hoverColor: Colors.blue[200],
                          hintText: 'Tag auswählen'),
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));

                        dateController.value =
                            TextEditingValue(text: format.format(date));
                      },
                    ),
                  ),
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
                        59842,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stimmung',
                        'Neutral',
                        59840,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stimmung',
                        'Traurig',
                        58361,
                        Colors.cyan[400],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stimmung',
                        'Gereizt',
                        58365,
                        Colors.cyan[400],
                        statusList,
                      ),
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
                        'Zucken',
                        58869,
                        Colors.lightBlue[200],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'symptome',
                        'Bewusstlos',
                        58419,
                        Colors.lightBlue[200],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'symptome',
                        'Krämpfe',
                        60118,
                        Colors.lightBlue[200],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'symptome',
                        'Fieber',
                        58534,
                        Colors.lightBlue[200],
                        statusList,
                      ),
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
                        'Entspannt',
                        60130,
                        Colors.indigo[200],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stress',
                        'Unruhe',
                        60126,
                        Colors.indigo[200],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stress',
                        'Anspannung',
                        58869,
                        Colors.indigo[200],
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'stress',
                        'Stress',
                        59222,
                        Colors.indigo[200],
                        statusList,
                      ),
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
    Status status = new Status(
        id: null, stimmung: stimmung, symptome: symptome, stress: stress);
    print(status.toJson());
    statusSetup(status);
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

Future<void> statusSetup(Status status) async {
  CollectionReference statusref =
      FirebaseFirestore.instance.collection('status');
  //DocumentReference statusref =FirebaseFirestore.instance.collection('status').doc('Test');
  statusref.add({
    'stimmung': status.stimmung.name,
    'symptome': status.symptome.name,
    'stress': status.stress.name,
    'time': timeController.text,
    'date': dateController.text,
    'iconstimung': status.stimmung.iconData
  });
}

void functionToDatabase(String string) {
  //if(time!=null){
  print(string);
  //}else{
  //  showDialog(context: context);
  //}
}
