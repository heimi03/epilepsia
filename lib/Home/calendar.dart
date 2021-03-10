import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
   Calendar({Key key,}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
        child: SfCalendar(
          //dataSource: MeetingDataSource(_getDataSource()),
          view: CalendarView.month,
          firstDayOfWeek: 1,
          todayHighlightColor: Colors.red.shade200,
          backgroundColor: Colors.blueGrey[50],
          showNavigationArrow: true,
          cellEndPadding: 5,
          selectionDecoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.blue.shade200, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            shape: BoxShape.rectangle,
            )
     
        )
      
    
    );
  }
}