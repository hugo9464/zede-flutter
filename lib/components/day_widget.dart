import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayView extends StatelessWidget {
  const DayView({required this.date, Key? key}) : super(key: key);

  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[Text(date.toString())],
    );
  }
}
