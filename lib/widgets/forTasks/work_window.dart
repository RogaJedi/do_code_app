import 'package:flutter/material.dart';

import 'constructor/row_item.dart';
import 'constructor/task_data.dart';

Widget _buildDropZone() {
  return Container(
    height: 80,
    width: 100,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
  );
}


Widget WorkWindow(BuildContext context, TaskData task) {
  double screenWidth = MediaQuery.of(context).size.width;
  double areaWidth = screenWidth - 20;

  return Container(
    width: areaWidth,
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xFFcecece),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(task.rows.length, (rowIndex) {
          final row = task.rows[rowIndex];

          return Row(
            children: [
              Text("${rowIndex + 1}.", style: const TextStyle(fontSize: 40)),
              const SizedBox(width: 10),

              ...row.items.map((item) {
                if (item.type == RowItemType.text) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      item.text!,
                      style: const TextStyle(fontSize: 40),
                    ),
                  );
                } else {
                  return _buildDropZone();
                }
              }),
            ],
          );
        }),
      ),
    ),
  );
}