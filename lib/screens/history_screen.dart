import 'package:flutter/material.dart';
import 'package:zede_app/components/history_screen_content.dart';
import 'package:zede_app/components/number_picker.dart';
import 'package:zede_app/models/Weighing.dart';
import 'package:zede_app/services/api/WeighingService.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage();

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final DateTime _focusedDay = DateTime.now();

  late Future<List<Weighing>> weighingsFuture;
  late List<Weighing> _weighings;

  Map<DateTime, Weighing> buildWeighingMap(List<Weighing>? weighings) {
    return {for (var weighing in weighings!) weighing.date: weighing};
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
      backgroundColor: const Color(0xff57e589),
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
                      return const Text('Loading....');
                    default:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: Text("Ajouter une pesée"),
                    content: NumberPicker(context: context));
              });
        },
        backgroundColor: const Color(0xff57e589),
        child: const Icon(Icons.add),
      ),
    );
  }
}
