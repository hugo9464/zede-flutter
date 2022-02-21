import 'package:flutter/material.dart';
import 'package:zede_app/components/weighing_type.dart';
import 'package:zede_app/models/Weighing.dart';

class WeighingDetails extends StatelessWidget {
  const WeighingDetails({Key? key, required this.weighings}) : super(key: key);

  final List<Weighing> weighings;
  final num fontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: weighings
            .map((e) => Row(children: [getWeighingType(e.type, e.weight)]))
            .toList());
  }

  Widget getWeighingType(String type, num weight) {
    switch (type) {
      case "0":
        {
          return WeighingType(type: "Grise", weight: weight);
        }
      case "1":
        {
          return WeighingType(type: "Verte", weight: weight);
        }
      case "2":
        {
          return WeighingType(type: "Jaune", weight: weight);
        }
      default:
        throw Exception;
    }
  }
}
