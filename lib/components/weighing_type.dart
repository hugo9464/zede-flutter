import 'package:flutter/material.dart';

class WeighingType extends StatelessWidget {
  const WeighingType({Key? key, required this.type, required this.weight})
      : super(key: key);

  final String type;
  final num weight;
  final double fontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
          decoration: BoxDecoration(
              color: getColor(type),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Text(
            type,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
        ),
        SizedBox(width: 20.0),
        Text(weight.toString() + ' kg', style: TextStyle(fontSize: fontSize)),
        SizedBox(width: 20.0),
        TextButton(
          onPressed: () {},
          child: Text(
            'Modifier ma pesée',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 15.0,
                fontFamily: 'VentiCF-Light',
                color: Colors.black),
          ),
        )
      ],
    );
  }

  getColor(String type) {
    switch (type) {
      case "Jaune":
        return Color(0xffE8B136);
      case "Verte":
        return Color(0xff177328);
      case "Grise":
        return Color(0xff636363);
    }
  }
}
