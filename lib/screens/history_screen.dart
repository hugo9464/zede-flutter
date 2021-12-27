import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zede_app/models/Weighing.dart';
import 'package:zede_app/services/api/WeighingService.dart';

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

class HistoryPage extends StatefulWidget {
  const HistoryPage();

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Event> _getEventsForDay(DateTime day, List<Weighing>? weighings) {
    if (weighings != null) {
      return weighings
          .where((weighing) => isSameDay(day, weighing.date))
          .map((weighing) => Event("toto"))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mon historique'),
        ),
        body: FutureBuilder<List<Weighing>>(
            future: WeighingService.getAllWeighings(),
            builder: (context, snapshot) => TableCalendar(
                  locale: 'fr_FR',
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.now(),
                  focusedDay: _focusedDay,
                  calendarFormat: CalendarFormat.month,
                  headerStyle: HeaderStyle(formatButtonVisible: false),
                  eventLoader: (day) {
                    return _getEventsForDay(day, snapshot.data);
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
                )));
  }
}
