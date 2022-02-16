import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zede_app/models/Weighing.dart';

import 'day_widget.dart';

class HistoryScreenContent extends StatefulWidget {
  final DateTime focusedDay;
  final List<Weighing> weighings;

  const HistoryScreenContent(
      {Key? key, required this.focusedDay, required this.weighings})
      : super(key: key);

  @override
  _HistoryScreenContentState createState() => _HistoryScreenContentState();
}

class _HistoryScreenContentState extends State<HistoryScreenContent> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.focusedDay;
  }

  List<Weighing> _getEventsForDay(DateTime day) {
    return List.from(
        widget.weighings.where((element) => isSameDay(element.date, day)));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TableCalendar(
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
          ),
          Expanded(
              child: Container(
                  child: IntrinsicHeight(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      DayView(
                        date: _selectedDay,
                        weighings: widget.weighings
                            .where((weighing) =>
                                isSameDay(weighing.date, _selectedDay))
                            .toList(),
                      )
                    ],
                  )),
                  decoration: new BoxDecoration(
                      color: Color(0xfffffffa),
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0)))))
        ],
      ),
    );
  }
}
