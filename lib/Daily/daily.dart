import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgetsport.dart';

class Daily extends StatefulWidget {
   Daily({Key key,}) : super(key: key);
  @override
  _DailyState createState() => _DailyState();
}

String dropdownValue = 'One';

class _DailyState extends State<Daily> {
  final timeController = TextEditingController();
  int _value = 1;
  TextEditingController nameController = TextEditingController();
  String fullName = '';
  @override
  Widget build(BuildContext context) {
   var now = DateTime.now();
   DateFormat format = DateFormat('dd.MM.yyyy');
  String day = format.format(now);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
            child: Column(
              children:[
                Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  child: Column(
                    children: [
                       Icon(
                        Icons.clear, //test
                        size: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
               Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
  onPressed: () {
      // Respond to button press
  },
  icon: Icon(Icons.add, size: 18),
  label: Text("Hinzufügen"),
  style: ElevatedButton.styleFrom(
      primary: Colors.indigo[200],
      onPrimary: Colors.white,
      onSurface: Colors.grey,
    ),
)
              ),
            ),
                
  
          ],
        ),
Align(
            alignment: Alignment.bottomCenter,
            child: Text(day,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
),
Container(
  margin: const EdgeInsets.all(15),
  child:   TextField(
  
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
Divider(height: 15,),
Align(
            alignment: Alignment.bottomCenter,
            child: Text('Wie lange machst du heute Sport?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
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

            Container(
              margin: const EdgeInsets.all(15),
              child: TextField(
                  controller: nameController,
                  decoration: 
                  InputDecoration(
                     suffixIcon: Icon(Icons.drive_file_rename_outline),
                    border: OutlineInputBorder(),
                    labelText: 'Andere Sportarten',
                  ),
                  onChanged: (text) {
                    setState(() {
                      fullName = text;
                    });
                  }),
            ),

   Row(children: [
 Widgetsport(widget.key,'Joggen',Icon(Icons.directions_run,size: 30,),Colors.blue,null),
 Widgetsport(widget.key,'Gehen',Icon(Icons.directions_walk,size: 30,),Colors.blue,null),
   ],),
   Row(children: [
 Widgetsport(widget.key,'Reiten',Icon(Icons.landscape,size: 30,),Colors.blue,null),
 Widgetsport(widget.key,'Fahrrad fahren',Icon(Icons.directions_bike,size: 30,),Colors.blue,null),
   ],),
   Row(children: [
 Widgetsport(widget.key,'Schwimmen',Icon(Icons.pool,size: 30,),Colors.blue,null),
 Widgetsport(widget.key,'Golfen',Icon(Icons.golf_course,size: 30,),Colors.blue,null),
   ],),
   Row(children: [
 Widgetsport(widget.key,'Fußball',Icon(Icons.sports_soccer,size: 30,),Colors.blue,null),
 Widgetsport(widget.key,'Gymnastik',Icon(Icons.alarm_on,size: 30,),Colors.blue,null),
   ],),
   Row(children: [
 Widgetsport(widget.key,'Tischtennis',Icon(Icons.sports_basketball,size: 30,),Colors.blue,null),
 Widgetsport(widget.key, 'Fitness',Icon(Icons.fitness_center,size: 30,),Colors.blue,null),
   ],),
    Row(children: [
 Widgetsport(widget.key,'Tennis',Icon(Icons.sports_tennis,size: 30,),Colors.blue,null),
 Widgetsport(widget.key,'Ski fahren',Icon(Icons.ac_unit,size: 30,),Colors.blue,null),
   ],),

   
          
              ]
),
        ),
      ),
    );
  }}


void functionToDatabase(String string){
  //if(time!=null){
  print(string);
  //}else{
  //  showDialog(context: context);
  //}
}