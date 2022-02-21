import 'package:flutter/material.dart';
import 'package:zede_app/components/type_widget.dart';

class WeighingType extends StatelessWidget {
  const WeighingType({Key? key, required this.type, required this.weight})
      : super(key: key);

  final String type;
  final num weight;
  final double fontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TypeWidget(type: type),
        SizedBox(width: 20.0),
        Text(weight.toString() + ' kg', style: TextStyle(fontSize: fontSize)),
        SizedBox(width: 20.0),
        TextButton(
          onPressed: () {},
          child: Text(
            'Modifier ma pesée',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: fontSize,
                fontFamily: 'VentiCF-Light',
                color: Colors.black),
          ),
        )
      ],
    );
  }
}
