import 'package:epilepsia/config/farben.dart';
import 'package:epilepsia/model/healthy/stimmung.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatefulWidget {
  const StatusWidget(
      Key key, this.id, this.text, this.iconData, this.color, this.statusList)
      : super(key: key);

  final String text;
  final int iconData;
  final Color color;
  final String id;
  final List<StatusIcons> statusList;

  @override
  _StatusWidgetState createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  String id;
  String text;
  int iconData;
  Color color;
  bool change = false;

  @override
  void initState() {
    text = widget.text;
    iconData = widget.iconData;
    color = widget.color;
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(IconData(iconData, fontFamily: 'MaterialIcons')),
                onPressed: () {
                  setState(
                    () {
                      StatusIcons statusIcon = new StatusIcons(
                          id: id, color: color, name: text, iconData: iconData);
                      if ((widget.statusList.singleWhere(
                              (element) => element.id == statusIcon.id,
                              orElse: () => null)) !=
                          null) {
                        print("Exist");
                        if ((widget.statusList.singleWhere(
                                (element) => element.name == statusIcon.name,
                                orElse: () => null)) !=
                            null) {
                               change = false;
                          color = widget.color;
                          widget.statusList.removeWhere(
                              (element) => element.name == statusIcon.name);
                            }
                      } else {
                        print("not Exist");
                        
                          change = true;
                          color = dunkelblau;
                          widget.statusList.add(statusIcon);
                        
                      }
                    },
                  );
                  //functionToDatabase(string);
                },
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
