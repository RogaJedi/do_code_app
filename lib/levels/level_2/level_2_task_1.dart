import '../../widgets/forTasks/constructor/row_item.dart';
import '../../widgets/forTasks/constructor/task_data.dart';

const level_2_task1 = TaskData(
  id: "l2_t1",
  rows: [
    TaskRowData([
      RowItem.text("int a["),
      RowItem.drop(),
      RowItem.text("]"),
    ]),
    TaskRowData([
      RowItem.text("double b["),
      RowItem.drop(),
      RowItem.text("]"),
    ]),
    TaskRowData([
      RowItem.text("string c["),
      RowItem.drop(),
      RowItem.text("]"),
    ]),
  ],
  blocks: ["1, 2", "0.5, 4", "\"hi\", \"bye\""],
    taskText: []
);