import 'package:flutter/material.dart';

class AddMedication extends StatefulWidget {
  AddMedication({
    Key key,
  }) : super(key: key);
  @override
  _AddMedicationState createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  TextEditingController nameController = TextEditingController();
  String fullName = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      color: Colors.blueGrey[50],
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 5, left: 10),
            ),
            TextField(
                controller: nameController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.drive_file_rename_outline),
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                onChanged: (text) {
                  setState(() {
                    fullName = text;
                  });
                }),
            TextField(
                controller: nameController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.drive_file_rename_outline),
                  border: OutlineInputBorder(),
                  labelText: 'Dosis: z.B. 300mg oder 2 Tabletten',
                ),
                onChanged: (text) {
                  setState(() {
                    fullName = text;
                  });
                }),
            TextField(
                controller: nameController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.drive_file_rename_outline),
                  border: OutlineInputBorder(),
                  labelText: 'Arzneimittelplan',
                ),
                onChanged: (text) {
                  setState(() {
                    fullName = text;
                  });
                }),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Icon',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/image/pill.png', height: 30, width: 30),
                Image.asset('assets/image/pill2.png', height: 30, width: 30),
                Image.asset('assets/image/pill3.png', height: 30, width: 30),
                Image.asset('assets/image/pill4.png', height: 30, width: 30),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Farbe',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                  height: 30,
                  width: 30,
                  color: Colors.blue,
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                  height: 30,
                  width: 30,
                  color: Colors.green,
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                   height: 30,
                  width: 30,
                  color: Colors.red,
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                   height: 30,
                  width: 30,
                  color: Colors.yellow,
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                   height: 30,
                  width: 30,
                  color: Colors.orange,
                ),
            ]
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
          
    );
  }
}
