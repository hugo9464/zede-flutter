import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:zede_app/services/api/WeighingService.dart';

class NumberPicker extends StatefulWidget {
  const NumberPicker({Key? key, required BuildContext context})
      : super(key: key);

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  double _currentDoubleValue = 0.0;

  int? typeIndex = 0;
  final Map<int, Widget> types = const <int, Widget>{
    0: Text("Tout venant"),
    1: Text("Verre"),
    2: Text("Carton"),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        CupertinoSlidingSegmentedControl(
            groupValue: typeIndex,
            children: types,
            onValueChanged: (int? newValue) {
              setState(() {
                typeIndex = newValue;
              });
            }),
        DecimalNumberPicker(
          value: _currentDoubleValue,
          minValue: 0,
          maxValue: 100,
          decimalPlaces: 3,
          onChanged: (value) => setState(() => _currentDoubleValue = value),
        ),
        const SizedBox(height: 32),
        TextButton(
          onPressed: () => sendWeighing(context: context),
          child: const Text(
            'Enregistrer ma pesée',
          ),
        ),
      ],
    );
  }

  sendWeighing({required BuildContext context}) {
    WeighingService.saveWeighing(
      userId: "userId",
      type: typeIndex,
      weight: _currentDoubleValue,
      // date: DateTime.now()
    );
    Navigator.pop(context);
  }
}
