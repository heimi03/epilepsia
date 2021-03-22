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
  List<String> wiederholung = <String>["Täglich", "Wöchentlich", "Monatlich"];
  String _dropDownWiederholung;
  final timeController = TextEditingController();
  final timeController1 = TextEditingController();
  final timeController2 = TextEditingController();

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
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat('dd.MM.yyyy');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Text("Anzahl der Pilleneinnahmen - Uhrzeit auswählen"),
          IconButton(
            icon: Icon(Icons.add_alarm),
            onPressed: () {
              setState(() {
                itemCount++;
              });
            },
          ),
          Container(
            height: 90,
            child: ListView.builder(
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index) {
                  return TextField(
                    readOnly: true,
                    controller: timeController,
                    decoration: InputDecoration(
                        hoverColor: Colors.blue[200],
                        hintText: 'Uhrzeit auswählen'),
                    onTap: () async {
                      var time = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
                      timeController.text = time.format(context);
                    },
                  );
                }),
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
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                child: DropdownButton(
                  hint: _dropDownWiederholung == null
                      ? Text('')
                      : Text(
                          _dropDownWiederholung,
                          style: TextStyle(color: Colors.blue),
                        ),
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.blue),
                  items: wiederholung.map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _dropDownWiederholung = val;
                      },
                    );
                  },
                ),
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
            onPressed: () {},
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
