import 'package:flutter/widgets.dart';

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting({this.eventName, this.from, this.to, this.isAllDay});

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  String from;

  /// To which is equivalent to end time property of [Appointment].
  String to;

  // /// Background which is equivalent to color property of [Appointment].
  // Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;

  factory Meeting.fromJson(Map<String, dynamic> data) {
    var dateTimeFrom = data['from'].toDate();
    var dateTimeTo = data['to'].toDate();
    //DateTime dateTimeFrom = DateTime.parse(data['from']);
    //DateTime dateTimeTo = DateTime.parse(data['to']);
   // Color color = Color(data['farbe']);
    return Meeting(
      eventName: data['eventName'],
      from: dateTimeFrom,
      to: dateTimeTo,
      //background: color,
      isAllDay: data['isAllDay'],
    );
  }
}

