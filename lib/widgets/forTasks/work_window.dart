import 'package:flutter/material.dart';

Widget TaskRow(String taskNumber, Widget task) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "$taskNumber.",
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
        ),
      ),
      SizedBox(width: 10,),
      task
    ],
  );
}


Widget WorkWindow(BuildContext context, List<Widget> threeTasks) {

  double screenWidth = MediaQuery.of(context).size.width;
  double areaWidth = screenWidth - 20;

  return Container(
      width: areaWidth,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFcecece),
      ),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskRow('1', threeTasks[0]),
                TaskRow('2', threeTasks[1]),
                TaskRow('3', threeTasks[2]),
              ],
            ),
          )
      )
  );
}