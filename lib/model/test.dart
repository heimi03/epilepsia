import 'package:epilepsia/model/meeting.dart';
import 'package:epilepsia/model/termin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  // @override
  // Color getColor(int index) {
  //   return appointments[index].background;
  // }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }

  
  // @override
  // String getUserId(int index) {
  //   return appointments[index].from;
  // }
  //  @override
  // String getName(int index) {
  //   return appointments[index].from;
  // }

  //  @override
  // TimeOfDay getTagesauswahl(int index) {
  //   return appointments[index].from;
  // }

  // @override
  // TimeOfDay getVon(int index) {
  //   return appointments[index].from;
  // }

  // @override
  // DateTime getBis(int index) {
  //   return appointments[index].from;
  // }

  //  @override
  // StatusIcons getFarbe(int index) {
  //   return appointments[index].from;
  // }
}

//  String userid;
//   String name;
//   DateTime tagesauswahl;
//   TimeOfDay von;
//   TimeOfDay bis;
//   StatusIcons farbe;