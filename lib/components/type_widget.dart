import 'package:flutter/material.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
      decoration: BoxDecoration(
          color: getColor(type),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Text(
        type,
        style: TextStyle(color: Colors.white, fontSize: 15.0),
      ),
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
