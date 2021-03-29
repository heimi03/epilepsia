
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epilepsia/model/meeting.dart';
import 'package:epilepsia/model/test.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  Calendar({
    Key key,
  }) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<Meeting> meetings;
  CalendarDataSource querySnapshot;
  dynamic data;
  List<Color> _colorCollection;

  @override
  void initState() {
    // _initializeEventColor();
    // getTerminData().then((results) {
    //   print("results");
    //   print(results);
    //   setState(() {
    //     if (results != null) {
    //       querySnapshot = results;
    //     }
    //   });
    // });
  }
  Widget build(BuildContext context) {
    if(querySnapshot != null){
      return CircularProgressIndicator();
    }else{
      return Scaffold(
        body: SfCalendar(
      view: CalendarView.month,
      dataSource: MeetingDataSource(_getDataSource()),
      // by default the month appointment display mode set as Indicator, we can
      // change the display mode as appointment using the appointment display
      // mode property
      monthViewSettings: MonthViewSettings(
         showAgenda: true,
              agendaViewHeight: 200,
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    ));
  //      return Container(
  //       margin: const EdgeInsets.only(top: 10),
  //       child: SfCalendar(
  //           dataSource: querySnapshot,
  //           view: CalendarView.month,
  //           monthViewSettings: MonthViewSettings(
  //             showAgenda: true,
  //             agendaViewHeight: 400,
  //           ),
  //           firstDayOfWeek: 1,
  //           todayHighlightColor: Colors.red.shade200,
  //           backgroundColor: Colors.blueGrey[50],
  //           showNavigationArrow: true,
  //           cellEndPadding: 5,
  //           selectionDecoration: BoxDecoration(
  //             color: Colors.transparent,
  //             border: Border.all(color: Colors.blue.shade200, width: 2),
  //             borderRadius: const BorderRadius.all(Radius.circular(4)),
  //             shape: BoxShape.rectangle,
  //           )));
  // }
    }
  
}
 List<Meeting> _getDataSource() {
    meetings = <Meeting>[];
    // final DateTime today = DateTime.now();
    // final DateTime startTime =
    //     DateTime(today.year, today.month, today.day, 9, 0, 0);
    // final DateTime endTime = startTime.add(const Duration(hours: 2));
    // meetings.add(Meeting(
    //     'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var result;
    // List<CalendarDataSource> list = <Terminmodel>[];

    firestore
        .collection("termin")
        .get().then((result){
          result.docs.forEach((result) {
          var data = result.data();
          meetings.add(Meeting.fromJson(data));
        });
      //list.add(termin);

    });
    return meetings;
  }
}
// import 'dart:math';
// import 'package:epilepsia/model/meeting.dart';
// import 'package:epilepsia/model/test.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:intl/intl.dart';
// import 'package:firebase_database/firebase_database.dart';

// class LoadDataFromFireBase extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FireBase',
//       home: LoadDataFromFireStore(),
//     );
//   }
// }

// class LoadDataFromFireStore extends StatefulWidget {
//   @override
//   LoadDataFromFireStoreState createState() => LoadDataFromFireStoreState();
// }

// class LoadDataFromFireStoreState extends State<LoadDataFromFireStore> {
//   DataSnapshot querySnapshot;
//   dynamic data;
//   List<Color> _colorCollection;

//   @override
//   void initState() {
//     // _initializeEventColor();
//     getDataFromDatabase().then((results) {
//       print("results");
//       print(results);
//       setState(() {
//         if (results != null) {
//           querySnapshot = results;
//         }
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _showCalendar(),
//     );
//   }

//   _showCalendar() {
//     print(querySnapshot);
//     if (querySnapshot != null) {
//       List<Meeting> collection;
//       var showData = querySnapshot.value;
//       Map<dynamic, dynamic> values = showData;
//       List<dynamic> key = values.keys.toList();

//       if (values != null) {
//         for (int i = 0; i < key.length; i++) {
//           data = values[key[i]];
//           collection ??= <Meeting>[];
//           final Random random = new Random();
//           collection.add(Meeting(
//               eventName: data['Subject'],
//               isAllDay: false,
//               from: DateFormat('dd/MM/yyyy HH:mm:ss').parse(data['StartTime']),
//               to: DateFormat('dd/MM/yyyy HH:mm:ss').parse(data['EndTime']),
//               background: _colorCollection[random.nextInt(9)]));
//         }
//       } else {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }

//       return SafeArea(
//           child: Column(
//         children: [
//           Container(
//             height: 400,
//             child: SfCalendar(
//               view: CalendarView.month,
//               initialDisplayDate: DateTime(2020, 4, 5, 9, 0, 0),
//               dataSource: _getCalendarDataSource(collection),
//               monthViewSettings: MonthViewSettings(showAgenda: true),
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 final dbRef =
//                     FirebaseDatabase.instance.reference().child("CalendarData");
//                 dbRef.push().set({
//                   "StartTime": '07/04/2020 07:00:00',
//                   "EndTime": '07/04/2020 08:00:00',
//                   "Subject": 'NewMeeting',
//                 }).then((_) {
//                   // Scaffold.of(context).showSnackBar(
//                   //     SnackBar(content: Text('Successfully Added')));
//                   print("erfolgreich hinzugefügt");
//                 }).catchError((onError) {
//                   print(onError);
//                 });
//               },
//               child: Text("Add")),
//           ElevatedButton(
//               onPressed: () {
//                 final dbRef =
//                     FirebaseDatabase.instance.reference().child("CalendarData");
//                 dbRef.remove();
//               },
//               child: Text("Delete")),
//         ],
//       ));
//     } else {
//       return Column(children:[
//         Container(child: TextButton(child: Text("Eintrag hinzufügen"),onPressed: () => null,)),
//       ]);
//     }
//   }

// //   void _initializeEventColor() {
// //     this._colorCollection = new List<Color>();
// //     _colorCollection.add(const Color(0xFF0F8644));
// //     _colorCollection.add(const Color(0xFF8B1FA9));
// //     _colorCollection.add(const Color(0xFFD20100));
// //     _colorCollection.add(const Color(0xFFFC571D));
// //     _colorCollection.add(const Color(0xFF36B37B));
// //     _colorCollection.add(const Color(0xFF01A1EF));
// //     _colorCollection.add(const Color(0xFF3D4FB5));
// //     _colorCollection.add(const Color(0xFFE47C73));
// //     _colorCollection.add(const Color(0xFF636363));
// //     _colorCollection.add(const Color(0xFF0A8043));
// //   }
// // }

//   MeetingDataSource _getCalendarDataSource([List<Meeting> collection]) {
//     List<Meeting> meetings = collection ?? <Meeting>[];
//     return MeetingDataSource(meetings);
//   }
// }


