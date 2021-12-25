import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeighingService {
  static CollectionReference weighings =
      FirebaseFirestore.instance.collection('weighings');

  // For registering a new user
  static Future<void> addWeighing({
    required String userid,
    required int? type,
    required double weight,
    required DateTime date,
  }) async {
    // Call the user's CollectionReference to add a new user
    return weighings
        .add({
          'userid': userid,
          'type': type,
          'weight': weight,
          'date': date,
        })
        .then((value) => print("Weighing Added"))
        .catchError((error) => print("Failed to add weighing: $error"));
  }
}
