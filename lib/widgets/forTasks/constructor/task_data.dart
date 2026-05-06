import 'package:do_code/levels/level_1/level_1_task_1.dart';
import 'package:do_code/levels/level_2/level_2_task_1.dart';
import 'package:do_code/widgets/forTasks/constructor/row_item.dart';

class TaskRowData {
  final List<RowItem> items;

  const TaskRowData(this.items);
}

class TaskData {
  final String id;

  final List<TaskRowData> rows;
  final List<String> blocks;
  final List<String> taskText;

  const TaskData({
    required this.id,
    required this.rows,
    required this.blocks,
    required this.taskText
  });
}

final Map<String, TaskData> taskMap = {
  "l1_t1": level_1_task1,


  "l2_t1": level_2_task1
};