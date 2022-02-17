import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zede_app/components/weighing_widget.dart';
import 'package:zede_app/models/Weighing.dart';
import 'package:intl/intl.dart';

class DayView extends StatelessWidget {
  const DayView({required this.date, required this.weighings, Key? key})
      : super(key: key);

  final DateTime date;
  final List<Weighing> weighings;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(getDateAsString(date)),
      Expanded(child: WeighingDetails(weighings: weighings))
    ]);
  }

  getDateAsString(DateTime date) {
    return DateFormat('yMMMMEEEEd', 'fr_FR').format(date);
  }
}
