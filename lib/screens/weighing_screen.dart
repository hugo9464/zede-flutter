import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zede_app/components/number_picker.dart';

class WeighingScreen extends StatefulWidget {
  const WeighingScreen();

  @override
  _WeighingScreenState createState() => _WeighingScreenState();
}

class _WeighingScreenState extends State<WeighingScreen> {
  late final double _currentWeighing = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma pesée'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // children: [const NumberPicker()],
        ),
      ),
    );
  }
}
