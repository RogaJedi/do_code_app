import 'package:flutter/material.dart';

Widget Template(String varName) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(width: 10,),
      Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),
      ),
      SizedBox(width: 10,),
      Text(
        varName,
        style: TextStyle(
            color: Colors.black,
            fontSize: 50
        ),
      ),
    ],
  );
}

List<Widget> Task1Tasks(){

  return [
    Template('a'),
    Template('b'),
    Template('c')
  ];

}