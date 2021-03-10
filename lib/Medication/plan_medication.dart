import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlanMedication extends StatefulWidget {
  PlanMedication({
    Key key,
  }) : super(key: key);
  @override
  _PlanMedicationState createState() => _PlanMedicationState();
}

class _PlanMedicationState extends State<PlanMedication> {
  final dateController = TextEditingController();
  final dateController1 = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
    dateController1.dispose();
    super.dispose();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController nameController1 = TextEditingController();
  String fullName = '';
  int _value2 = 1;
  int _value3 = 1;
  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat('dd.MM.yyyy');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: DropdownButton(
              hint: Text("Anzahl der Pilleneinnahme"),
              value: _value3,
              items: [
                DropdownMenuItem(
                  child: Text("1"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("2"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("3"),
                  value: 3,
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _value3 = value;
                  if (value == "1") {
                    newdrop();
                  } else if (value == "2") {
                    newdrop();
                  }
                });
              },
            ),
          ),
          Divider(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: Row(children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Wiederholungen: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
                    child: Text("Täglich"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Wöchentlich"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("Monatlich"),
                    value: 3,
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
          Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: TextField(
              readOnly: true,
              controller: dateController1,
              decoration: InputDecoration(
                  hoverColor: Colors.blue[200],
                  hintText: 'Startdatum der Einnahme'),
              onTap: () async {
                var date1 = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));

                dateController1.value =
                    TextEditingValue(text: format.format(date1));
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: TextField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(
                  hoverColor: Colors.blue[200],
                  hintText: 'Enddatum der Einnahme'),
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
          Container(
            margin: const EdgeInsets.only(right: 15.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '*Kann auch leer gelassen werden',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: TextField(
                controller: nameController1,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.drive_file_rename_outline),
                  border: OutlineInputBorder(),
                  labelText: 'Erinnerungstext',
                ),
                onChanged: (text1) {
                  setState(() {
                    fullName = text1;
                  });
                }),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Respond to button press
            },
            icon: Icon(Icons.add, size: 18),
            label: Text("Hinzufügen"),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[200],
              onPrimary: Colors.white,
              onSurface: Colors.grey,
            ),
          )
        ]),
      ),
    );
  }
}

Widget newdrop() {
  int _value4 = 1;
  new DropdownButton(
    value: _value4,
    items: [
      DropdownMenuItem(
        child: Text("Uhrzeit"),
        value: 1,
      ),
      DropdownMenuItem(
        child: Text("2"),
        value: 2,
      ),
      DropdownMenuItem(
        child: Text("3"),
        value: 3,
      ),
    ],
  );
}
