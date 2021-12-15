import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zede_app/components/number_picker.dart';
import 'package:zede_app/services/firebase/firebase_weighing_service.dart';
import 'package:zede_app/utils/fire_auth.dart';

class WeighingScreen extends StatefulWidget {
  const WeighingScreen();

  @override
  _WeighingScreenState createState() => _WeighingScreenState();
}

class _WeighingScreenState extends State<WeighingScreen> {
  late final double _currentWeighing = 0;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma pesée'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const NumberPicker(),
          ],
        ),
      ),
    );
  }
}
