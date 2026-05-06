import 'package:flutter/material.dart';

import 'constructor/task_data.dart';

const blockColors = [
  Color(0xFF0077ca),
  Color(0xFF35ae00),
  Color(0xFF9300ac),
  Color(0xFFec7300),
  Color(0xFFca0000),
  Color(0xFF00ca7b),
];

const blockShadowColors = [
  Color(0xFF004779),
  Color(0xFF1f6800),
  Color(0xFF580067),
  Color(0xFF8d4500),
  Color(0xFF790000),
  Color(0xFF007949),
];

Color _getBlockColor(int index) {
  return blockColors[index % blockColors.length];
}

Color _getBlockShadowColor(int index) {
  return blockShadowColors[index % blockShadowColors.length];
}

Widget _buildArcadeBlock(String text, Color mainColor, Color shadowColor) {

  const double depth = 10;
  const double width = 110;
  const double height = 80;

  return SizedBox(
    width: width,
    height: height + depth,
    child: Stack(
      children: [
        Positioned(
          top: depth,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: shadowColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        )
      ],
    ),

  );
}

Widget _buildBlock(String text, Color color) {
  return Container(
    height: 70,
    width: 110,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    ),
  );
}

Widget BlocksWindow(BuildContext context, TaskData task) {
  double screenWidth = MediaQuery.of(context).size.width;
  double areaWidth = screenWidth - 20;

  return Container(
    width: areaWidth,
    height: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xFFcecece),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: task.blocks.asMap().entries.map((entry) {
            final index = entry.key;
            final block = entry.value;

            return _buildArcadeBlock(block, _getBlockColor(index), _getBlockShadowColor(index));
          }).toList(),
        ),
      )
    ),
  );
}