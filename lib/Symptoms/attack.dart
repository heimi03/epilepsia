import 'package:epilepsia/Symptoms/startseite.dart';
import 'package:epilepsia/config/dropdownitems.dart';
import 'package:epilepsia/model/healthy/attack.dart';
import 'package:epilepsia/model/healthy/stimmung.dart';
import 'package:flutter/material.dart';

import '../config/widget/widget.dart';

class Attackwidget extends StatefulWidget {
  Attackwidget({
    Key key,
  }) : super(key: key);
  @override
  _AttackwidgetState createState() => _AttackwidgetState();
}

class _AttackwidgetState extends State<Attackwidget> {
  final timeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String fullName = '';
  List<String> dauer = <String> ["10 Minuten", "20 Minuten", "30 Minuten", "45 Minuten", "60 Minuten", "90 Minuten"];
  List<String> anfallsart = <String> ["Vorgefühl", "Aura", "Fokal klonischer Anfall", "Fokal tonischer Anfall", "Fokal komplexer Anfall","Fokal komplexer Anfall","Absencen","Grand mal Anfall","Myoklonischer Anfall"];
  List<StatusIcons> statusList = <StatusIcons>[];
  String _dropDownDauer;
  String _dropDownAnfallsart;


  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Form(
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
                    alignment: Alignment.bottomLeft,
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
                    child: DropdownButton(       
                      hint: _dropDownDauer == null           ? Text('')           : 
                      Text(               _dropDownDauer,               
                      style: TextStyle(color: Colors.blue),             ),       
                            iconSize: 30.0,       
                      style: TextStyle(color: Colors.blue),       
                      items: dauer.map(         
                        (val) {           return 
                        DropdownMenuItem<String>(             value: val,             
                        child: Text(val),           );         },       ).toList(),       
                        onChanged: (val) {         setState(           () 
                        {             _dropDownDauer = val;           },         );       },     ),
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
                  Container(
                    margin:
                        EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                    child: DropdownButton(       
                      hint: _dropDownAnfallsart == null           ? Text('')           : 
                      Text(               _dropDownAnfallsart,               
                      style: TextStyle(color: Colors.blue),             ),       
                            iconSize: 30.0,       
                      style: TextStyle(color: Colors.blue),       
                      items: anfallsart.map(         
                        (val) {           return 
                        DropdownMenuItem<String>(             value: val,             
                        child: Text(val),           );         },       ).toList(),       
                        onChanged: (val) {         setState(           () 
                        {             _dropDownAnfallsart = val;           },         );       },     ),
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
                thickness: 3,
              ),
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
