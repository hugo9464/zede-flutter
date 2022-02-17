import 'package:flutter/material.dart';
import 'package:zede_app/models/Weighing.dart';

class WeighingDetails extends StatelessWidget {
  const WeighingDetails({Key? key, required this.weighings}) : super(key: key);

  final List<Weighing> weighings;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: weighings
          .map((e) => Row(children: [
                Text(getType(e.type)),
                Text(e.weight.toString() + ' kg')
              ]))
          .toList(),
    );
  }

  String getType(String type) {
    switch (type) {
      case "0":
        {
          return "Grise";
        }
      case "1":
        {
          return "Verte";
        }
      case "2":
        {
          return "Jaune";
        }
      default:
        {
          return "";
        }
    }
  }
}
