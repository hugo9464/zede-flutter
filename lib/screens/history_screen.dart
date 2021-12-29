import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
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

  late List<Weighing> weighings;

  List<Weighing> _getEventsForDay(DateTime day) {
    return List.from(
        weighings.where((element) => isSameDay(element.date, day)));
  }

  Map<DateTime, Weighing> buildWeighingMap(List<Weighing>? weighings) {
    return Map.fromIterable(weighings!,
        key: (weighing) => weighing.date, value: (weighing) => weighing);
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon historique'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureBuilder<List<Weighing>>(
                future: WeighingService.getAllWeighings(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Text('Loading....');
                    default:
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
                      else {
                        weighings = snapshot.data!;

                        return TableCalendar(
                          locale: 'fr_FR',
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.now(),
                          focusedDay: _focusedDay,
                          calendarFormat: CalendarFormat.month,
                          headerStyle: HeaderStyle(formatButtonVisible: false),
                          eventLoader: (day) {
                            return _getEventsForDay(day);
                          },
                          selectedDayPredicate: (day) {
                            // Use `selectedDayPredicate` to determine which day is currently selected.
                            // If this returns true, then `day` will be marked as selected.

                            // Using `isSameDay` is recommended to disregard
                            // the time-part of compared DateTime objects.
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            if (!isSameDay(_selectedDay, selectedDay)) {
                              // Call `setState()` when updating the selected day
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            }
                          },
                          // onFormatChanged: (format) {
                          //   if (_calendarFormat != format) {
                          //     // Call `setState()` when updating calendar format
                          //     setState(() {
                          //       _calendarFormat = format;
                          //     });
                          //   }
                          // },
                          onPageChanged: (focusedDay) {
                            // No need to call `setState()` here
                            _focusedDay = focusedDay;
                          },
                        );
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
