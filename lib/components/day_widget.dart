import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zede_app/components/weighing_widget.dart';
import 'package:zede_app/models/Weighing.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class DayView extends StatelessWidget {
  const DayView({required this.date, required this.weighings, Key? key})
      : super(key: key);

  final DateTime date;
  final List<Weighing> weighings;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(getDateAsString(date),
          style: TextStyle(
              fontSize: 30.0,
              color: Color(0xff2B2B2B),
              fontFamily: 'VentiCF-Ultra')),
      Expanded(child: WeighingDetails(weighings: weighings)),
      SizedBox(height: 50.0)
    ]);
  }

  getDateAsString(DateTime date) {
    var dateArray = DateFormat('yMMMMEEEEd', 'fr_FR').format(date).split(' ');
    return dateArray[0].capitalize() +
        ' ' +
        dateArray[1] +
        ' ' +
        dateArray[2].capitalize() +
        ' ' +
        dateArray[3];
  }
}
