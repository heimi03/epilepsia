import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Diary extends StatefulWidget {
   Diary({Key key,}) : super(key: key);
  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
       Image.asset('assets/image/pill5.png')
    );
  }
}