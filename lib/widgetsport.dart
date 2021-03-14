import 'package:epilepsia/config/farben.dart';
import 'package:flutter/material.dart';

class Widgetsport extends StatefulWidget {
  const Widgetsport(Key key,this.text,this.icon, this.color, this.string) : super(key: key);
  
  final String text; 
   final Icon icon;
   final Color color;
   final String string;
   

  @override
  _WidgetsportState createState() => _WidgetsportState();
}

class _WidgetsportState extends State<Widgetsport> {
     String text;
    Icon icon; 
    Color color;
    String string;
    bool change = false;
     @override
  void initState() {
    text = widget.text;
    icon = widget.icon;
    color = widget.color;
    string =widget.string;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
     return Expanded(
              child: Container(
                decoration: BoxDecoration(color: color,border: Border.all(),borderRadius: BorderRadius.all(Radius.circular(20)),),
              
                margin:
                    EdgeInsets.only(top: 25, bottom: 2, left: 15, right: 15),
                height: 90,
                child: TextButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
        icon: icon,
        color: Colors.indigo[700],
      ),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  onPressed: () {
               setState(() {
                 
                 if(!change){
                  change = true;
                  color = dunkelblau;
                 }else{
                   change = false;
                   color = widget.color;
                 }
                
           },);          
                //functionToDatabase(string);
              },
                ),
              ),
            );
  }
}
