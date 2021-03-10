import 'package:epilepsia/Symptoms/startseite.dart';
import 'package:flutter/material.dart';

class Sleep extends StatefulWidget {
  Sleep({
    Key key,
  }) : super(key: key);
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  final timeController = TextEditingController();
  final timeController1 = TextEditingController();

TimeOfDay startDate;
TimeOfDay endDate;
String minute = "";
String hours = "";
String zeit = "";
 
 @override
  void initState() {
    super.initState();
  }

  void dispose() {
    // Clean up the controller when the widget is removed
    timeController.dispose();
    super.dispose();
    timeController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(hours != "" && minute != ""){
zeit = "Dauer: " + hours + ":" + minute;
    }else if(hours == "" && minute != ""){
     zeit = "Dauer: " + "00:" + minute;
    }
    else if(hours != "" && minute == ""){
     zeit = "Dauer: " + hours + ":00";
    }else{
      zeit = "Bitte Zeit auswählen";
    }
    
    
       return Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(children: [
         

          TextField(
            readOnly: true,
            controller: timeController,
            decoration: InputDecoration(
                hoverColor: Colors.blue[200], hintText: 'Eingeschlafen'),
            onTap: () async {
             startDate = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );
               setState(() {
      
                hours = (endDate.hour - startDate.hour).toString();
                minute = (endDate.minute - startDate.minute).toString();
                          });
              timeController.text = startDate.format(context);
            },
          ),

          TextField(
            readOnly: true,
            controller: timeController1,
            decoration: InputDecoration(
                hoverColor: Colors.blue[200], hintText: 'Aufgestanden'),
            onTap: () async {
              endDate = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );
              setState(() {
      
                hours = (endDate.hour - startDate.hour).toString();  
                 minute = (endDate.minute - startDate.minute).toString();        });
              timeController1.text = endDate.format(context);
            },
          ),
          Divider(height: 15,),
Align(
              alignment: Alignment.bottomLeft,
              child: Text(
               zeit,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
Divider(height: 15,thickness: 5,),           
 Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Schlafqualität',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                boxWidget(
                    'Ausgeruht',
                    Icon(
                      Icons.wb_sunny,
                      size: 30,
                    ),
                    Colors.blue,
                    null),
                boxWidget(
                    'Unruhe',
                    Icon(
                      Icons.wb_cloudy,
                      size: 30,
                    ),
                    Colors.blue,
                    null),
                boxWidget(
                    'Insomnie',
                    Icon(
                      Icons.nights_stay,
                      size: 30,
                    ),
                    Colors.blue,
                    null),
                boxWidget(
                    'Albträume',
                    Icon(
                      Icons.flash_on,
                      size: 30,
                    ),
                    Colors.blue,
                    null),
              ],
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
            

            

  

        ]
        
        ));
  }
}
void functionToDatabase(){
  //if(time!=null){
  //}else{
  //  showDialog(context: context);
  //}
}
