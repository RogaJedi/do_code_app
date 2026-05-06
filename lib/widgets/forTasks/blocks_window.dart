import 'package:flutter/material.dart';

Widget BlocksWindow(BuildContext context, List<Widget> taskBlocks) {

  double screenWidth = MediaQuery.of(context).size.width;
  double areaWidth = screenWidth - 20;

  return Container(
    width: areaWidth,
    height: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(0xFFcecece),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          taskBlocks[0],
          taskBlocks[1],
          taskBlocks[2],
        ],
      ),
    ),
  );
}