import 'package:epilepsia/Symptoms/startseite.dart';
import 'package:epilepsia/config/dropdownitems.dart';
import 'package:epilepsia/model/healthy/attack.dart';
import 'package:epilepsia/model/healthy/stimmung.dart';
import 'package:flutter/material.dart';

import '../widget.dart';

class Attackwidget extends StatefulWidget {
  Attackwidget({
    Key key,
  }) : super(key: key);
  @override
  _AttackwidgetState createState() => _AttackwidgetState();
}

class _AttackwidgetState extends State<Attackwidget> {
  final timeController = TextEditingController();
  int _value = 1;
  int _value2 = 1;
  TextEditingController nameController = TextEditingController();
  String fullName = '';
  List<Dauer> dauer = getDauer;
  Dauer dauerDropdownTitleValue = new Dauer(0, "");

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    timeController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15.0),
                child: TextField(
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15),
                child: Row(children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Dauer: ',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    
                    margin:
                        EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Dauer",
                      ),
                      items: getDauer.map((Dauer dauer) {
                        return new DropdownMenuItem<String>(
                          value: dauer.daueritem,
                          child: Text(dauer.daueritem),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          //dauereintrag = newValue;
                          //print(newValue);
                        });
                      },
                    ),
                  ),
                  DropdownButton(
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("20 Minuten"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("30 Minuten"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("45 Minuten"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("60 Minuten"),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text("90 Minuten"),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text("120 Minuten"),
                        value: 6,
                      ),
                    ],
                    onChanged: (int value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                child: Row(children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Anfallsart: ',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 20,
                  ),
                  DropdownButton(
                    value: _value2,
                    items: [
                      DropdownMenuItem(
                        child: Text("Vorgefühl"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Aura"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Fokal klonischer Anfall"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("Fokal tonischer Anfall"),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text("Fokal komplexer Anfall"),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text("Absencen"),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text("Grand mal Anfall"),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text("Myoklonischer Anfall"),
                        value: 8,
                      ),
                    ],
                    onChanged: (int value) {
                      setState(() {
                        _value2 = value;
                      });
                    },
                  ),
                ]),
              ),
              Divider(
                thickness: 3,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Symptome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
//  Widget1(widget.key,'Zucken',Icon(Icons.bolt,size: 30,),Colors.lightBlue[200],null),
//  Widget1(widget.key,'Bewusstlos',Icon(Icons.snooze,size: 30,),Colors.lightBlue[200],null),
//  Widget1(widget.key,'Krämpfe',Icon(Icons.warning,size: 30,),Colors.lightBlue[200],null),
//  Widget1(widget.key,'Fieber',Icon(Icons.thermostat_outlined,size: 30,),Colors.lightBlue[200],null),
                ],
              ),
              Divider(
                thickness: 3,
              ),
              Container(
                  child: Icon(
                IconData(58717, fontFamily: 'MaterialIcons'),
              )),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.drive_file_rename_outline),
                      border: OutlineInputBorder(),
                      labelText: 'Notizen',
                    ),
                    onChanged: (text) {
                      setState(() {
                        fullName = text;
                      });
                    }),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //saveattack();
                },
                icon: Icon(Icons.add, size: 18),
                label: Text("Hinzufügen"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[200],
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveattack(DateTime datum, String dauer, String anfallsart,
      StatusIcons symptome, String notizen) {
    String id;
    Attack attack = new Attack(
        id: id,
        datum: datum,
        dauer: dauer,
        anfallsart: anfallsart,
        symptome: symptome,
        notizen: notizen);
  }
}
