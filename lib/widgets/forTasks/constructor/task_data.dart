
import 'package:do_code/widgets/forTasks/constructor/row_item.dart';

import 'package:do_code/levels/level_1/level_1_task_1.dart';
import '../../../levels/level_1/level_1_task_2.dart';
import '../../../levels/level_1/level_1_task_3.dart';

import 'package:do_code/levels/level_2/level_2_task_1.dart';
import '../../../levels/level_2/level_2_task_2.dart';
import 'package:do_code/levels/level_2/level_2_task_3.dart';


class TaskRowData {
  final List<RowItem> items;

  const TaskRowData(this.items);
}

class BlockData {
  final String id;
  final String label;
  final int colorIndex;

  const BlockData({
    required this.id,
    required this.label,
    required this.colorIndex,
  });
}

class TaskData {
  final String id;

  final List<TaskRowData> rows;
  final List<BlockData> blocks;

  final List<String> explanationTexts;

  final String taskText;
  final String successText;
  final String failText;

  final Map<String, String> correctAnswers;

  const TaskData({
    required this.id,
    required this.rows,
    required this.blocks,
    required this.explanationTexts,
    required this.taskText,
    required this.successText,
    required this.failText,
    required this.correctAnswers,
  });
}

final Map<String, TaskData> taskMap = {
  "l1_t1": level_1_task1,
  "l1_t2": level_1_task2,
  "l1_t3": level_1_task3,

  "l2_t1": level_2_task1,
  "l2_t2": level_2_task2,
  "l2_t3": level_2_task3
};