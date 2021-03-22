import 'package:epilepsia/model/healthy/stimmung.dart';
import 'package:epilepsia/config/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Diary extends StatefulWidget {
  Diary({
    Key key,
  }) : super(key: key);
  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  final dateController = TextEditingController();
   List<StatusIcons> statusList = <StatusIcons>[];
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timeController = TextEditingController();
    final timeController1 = TextEditingController();
    final dateController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    String fullName = '';
    DateFormat format = DateFormat('dd.MM.yyyy');
    final AlertDialog dialog = AlertDialog(
      title: Text('Termin hinzufügen'),
      content: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                    labelText: 'Terminname',
                  ),
                  onChanged: (text) {
                    setState(() {
                      fullName = text;
                    });
                  }),
              Container(
                child: TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                      hoverColor: Colors.blue[200], hintText: 'Datum'),
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
                    hoverColor: Colors.blue[200], hintText: 'Von'),
                onTap: () async {
                  var time = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );

                  timeController.text = time.format(context);
                },
              ),
              TextField(
                readOnly: true,
                controller: timeController1,
                decoration: InputDecoration(
                    hoverColor: Colors.blue[200], hintText: 'Bis'),
                onTap: () async {
                  var time = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );

                  timeController1.text = time.format(context);
                },
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
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Abbrechen'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Hinzufügen'),
        ),
      ],
    );
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 40, bottom: 5, left: 50, right: 50),
          child: TextField(
            readOnly: true,
            controller: dateController,
            decoration: InputDecoration(
                hoverColor: Colors.blue[200],
                hintText: 'Auswählen eines Tages'),
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
            child: TextButton(
          onPressed: () {
            showDialog<void>(context: context, builder: (context) => dialog);
          },
          child: Text("Termin eintragen"),
        )),
      ]),
    ));
  }
}
