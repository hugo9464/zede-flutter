import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:zede_app/utils/weighing_service.dart';

class NumberPicker extends StatefulWidget {
  const NumberPicker({ Key? key }) : super(key: key);

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  User? user = FirebaseAuth.instance.currentUser;
  double _currentDoubleValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        Text('Decimal', style: Theme.of(context).textTheme.headline6),
        DecimalNumberPicker(
          value: _currentDoubleValue,
          minValue: 0,
          maxValue: 100,
          decimalPlaces: 1,
          onChanged: (value) => setState(() => _currentDoubleValue = value),
        ),
        const SizedBox(height: 32),
        TextButton(
              onPressed: () => WeighingService.addWeighing(userid: user!.uid, type: "green", weight: _currentDoubleValue),
              child: Text(
                'Ajouter ma pesée de $_currentDoubleValue kg',
              ),
            ),
      ],
    );
  }
}