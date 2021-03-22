import 'package:epilepsia/config/farben.dart';
import 'package:epilepsia/model/healthy/stimmung.dart';
import 'package:epilepsia/config/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
   List<StatusIcons> statusList = <StatusIcons>[];
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
              children: [
                      StatusWidget(
                        widget.key,
                        'pill',
                        '',
                        58841,
                        Colors.blueGrey,
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'pill',
                        '',
                        58841,
                        Colors.blueGrey,
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'pill',
                        '',
                        58841, 
                        Colors.blueGrey,
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'pill',
                        '',
                        58841, 
                        Colors.blueGrey,
                        statusList,
                      ),
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
              children: [
                      StatusWidget(
                        widget.key,
                        'grün',
                        '',
                        57594,
                        Colors.green,
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'blau',
                        '',
                        57594,
                        Colors.blue,
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'gelb',
                        '',
                        57594, 
                        Colors.yellow,
                        statusList,
                      ),
                      StatusWidget(
                        widget.key,
                        'rot',
                        '',
                        57594, 
                        Colors.red,
                        statusList,
                      ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
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
