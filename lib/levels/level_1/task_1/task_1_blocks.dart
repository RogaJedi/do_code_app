import 'package:flutter/material.dart';

Widget Template(Color color, String text) {
  final height = 80.0;
  final width = 110.0;

  return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30
          ),
        ),
      )
  );
}

List<Widget> Task1Blocks(){

  return [
    Template(Colors.purple, "int"),
    Template(Colors.green, "double"),
    Template(Colors.blue, "string"),
  ];

}