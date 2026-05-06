import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ProgressLogic/progress_cubit.dart';
import '../../ProgressLogic/progress_state.dart';
import 'constructor/row_item.dart';
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

Widget _buildPlacedArcadeBlock(String text, Color mainColor, Color shadowColor) {

  const double depth = 10;
  const double width = 110;
  const double height = 80;

  return Container(
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
  );
}

Widget _buildDropZone(BuildContext context, String id) {
  return BlocBuilder<ProgressCubit, ProgressState>(
    builder: (context, state) {
      final cubit = context.read<ProgressCubit>();
      final placed = state.placedBlocks[id];

      return DragTarget<BlockData>(
        onWillAccept: (data) {
          return placed == null;
        },

        onAccept: (data) {
          cubit.placeBlock(id, data);
        },

        builder: (context, candidateData, rejectedData) {
          return GestureDetector(
            onTap: () {
              if (placed != null) {
                cubit.removeBlock(id);
              }
            },
            child: placed != null
                ? _buildPlacedArcadeBlock(
              placed.label,
              _getBlockColor(
                placed.colorIndex,
              ),
              _getBlockShadowColor(
                placed.colorIndex,
              ),
            )
                : Container(
              height: 80,
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black26),
              ),
            ),
          );
        },
      );
    },
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
                  return _buildDropZone(context, item.id!);
                }
              }),
            ],
          );
        }),
      ),
    ),
  );
}