import '../../widgets/forTasks/constructor/row_item.dart';
import '../../widgets/forTasks/constructor/task_data.dart';

const level_2_task3 = TaskData(

  id: "l2_t3",

  rows: [
    TaskRowData([
      RowItem.text("int a["),
      RowItem.drop("l2_t3_row1_slot"),
      RowItem.text("]"),
    ]),
    TaskRowData([
      RowItem.text("double b["),
      RowItem.drop("l2_t3_row2_slot"),
      RowItem.text("]"),
    ]),
    TaskRowData([
      RowItem.text("string c["),
      RowItem.drop("l2_t3_row3_slot"),
      RowItem.text("]"),
    ]),
  ],

  blocks: [
    BlockData(id: "l2_t3_block1", label: "1, 2", colorIndex: 0),
    BlockData(id: "l2_t3_block2", label: "0.5, 4", colorIndex: 1),
    BlockData(id: "l2_t3_block3", label: "\"Мяу\", \"Гав\"", colorIndex: 2),
  ],

  explanationTexts: ['lorem ipsum'],
  taskText: 'lorem ipsum',

  successText: 'good',
  failText: 'bad',

  correctAnswers: {
    "l2_t3_row1_slot": "l2_t3_block1",
    "l2_t3_row2_slot": "l2_t3_block2",
    "l2_t3_row3_slot": "l2_t3_block3",
  },
);