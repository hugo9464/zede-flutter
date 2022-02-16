import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zede_app/models/Weighing.dart';

class DayView extends StatelessWidget {
  const DayView({required this.date, required this.weighings, Key? key})
      : super(key: key);

  final DateTime? date;
  final List<Weighing> weighings;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weighings.map((e) => Text(e.weight.toString())).toList());
  }
}
