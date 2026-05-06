import '../../widgets/forTasks/constructor/row_item.dart';
import '../../widgets/forTasks/constructor/task_data.dart';

const level_2_task1 = TaskData(
  id: "l2_t1",
  rows: [
    TaskRowData([
      RowItem.text("int a["),
      RowItem.drop("l2_t1_r1_slot"),
      RowItem.text("]"),
    ]),
    TaskRowData([
      RowItem.text("double b["),
      RowItem.drop("l2_t1_r2_slot"),
      RowItem.text("]"),
    ]),
    TaskRowData([
      RowItem.text("string c["),
      RowItem.drop("l2_t1_r3_slot"),
      RowItem.text("]"),
    ]),
  ],
  blocks: [
    BlockData(id: "l2_t1_block1", label: "1, 2", colorIndex: 0),
    BlockData(id: "l2_t1_block2", label: "0.5, 4", colorIndex: 1),
    BlockData(id: "l2_t1_block3", label: "\"Мяу\", \"Гав\"", colorIndex: 2),
  ],
    taskText: []
);