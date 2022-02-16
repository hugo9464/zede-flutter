import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zede_app/components/WeighingsChart.dart';
import 'package:zede_app/components/day_widget.dart';
import 'package:zede_app/components/history_screen_content.dart';
import 'package:zede_app/models/Weighing.dart';
import 'package:zede_app/services/api/WeighingService.dart';
import 'package:zede_app/utils/StackedBarChart.dart';

// class Event {
//   final String title;

//   const Event(this.title);

//   @override
//   String toString() => title;
// }

class HistoryPage extends StatefulWidget {
  const HistoryPage();

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  late Future<List<Weighing>> weighingsFuture;
  late List<Weighing> _weighings;

  List<Weighing> _getEventsForDay(DateTime day) {
    return List.from(
        _weighings.where((element) => isSameDay(element.date, day)));
  }

  Map<DateTime, Weighing> buildWeighingMap(List<Weighing>? weighings) {
    return Map.fromIterable(weighings!,
        key: (weighing) => weighing.date, value: (weighing) => weighing);
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    weighingsFuture = WeighingService.getAllWeighings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff57e589),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            FutureBuilder<List<Weighing>>(
                future: weighingsFuture,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Text('Loading....');
                    default:
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
                      else {
                        _weighings = snapshot.data!;

                        return HistoryScreenContent(
                            focusedDay: _focusedDay, weighings: _weighings);
                      }
                  }
                }),
            // StackedBarChart.withSampleData()
          ],
        ),
      ),
    );
  }
}
