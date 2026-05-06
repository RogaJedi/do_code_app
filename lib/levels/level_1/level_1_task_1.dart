import '../../widgets/forTasks/constructor/row_item.dart';
import '../../widgets/forTasks/constructor/task_data.dart';

const level_1_task1 = TaskData(
  id: "l1_t1",
  rows: [
    TaskRowData([
      RowItem.drop(),
      RowItem.text("a"),
    ]),
    TaskRowData([
      RowItem.drop(),
      RowItem.text("b"),
    ]),
    TaskRowData([
      RowItem.drop(),
      RowItem.text("c"),
    ]),
  ],
  blocks: ["int", "double", "string"],
  taskText: []
);