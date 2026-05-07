import '../../widgets/forTasks/constructor/row_item.dart';
import '../../widgets/forTasks/constructor/task_data.dart';

const level_1_task3 = TaskData(

  id: "l1_t3",

  rows: [
    TaskRowData([
      RowItem.text("int a="),
      RowItem.drop("l1_t3_row_1_slot_1"),
      RowItem.text("-"),
      RowItem.drop("l1_t3_row_1_slot_2"),
    ]),
    TaskRowData([
      RowItem.text("int b="),
      RowItem.drop("l1_t3_row_2_slot_1"),
      RowItem.text("-"),
      RowItem.drop("l1_t3_row_2_slot_2"),
    ]),
    TaskRowData([
      RowItem.text("int c="),
      RowItem.drop("l1_t3_row_3_slot_1"),
      RowItem.text("-"),
      RowItem.drop("l1_t3_row_3_slot_2"),
    ]),
  ],

  blocks: [
    BlockData(id: "l1_t3_block1", label: "3", colorIndex: 0),
    BlockData(id: "l1_t3_block2", label: "7", colorIndex: 1),
    BlockData(id: "l1_t3_block3", label: "11", colorIndex: 2),
    BlockData(id: "l1_t3_block4", label: "19", colorIndex: 3),
    BlockData(id: "l1_t3_block5", label: "a", colorIndex: 4),
    BlockData(id: "l1_t3_block6", label: "b", colorIndex: 5)
  ],

  explanationTexts: ['lorem ipsum'],
  taskText: 'c == 12',

  successText: 'good',
  failText: 'bad',

  correctAnswers: {
    "l1_t3_row_1_slot_1": "l1_t3_block4",
    "l1_t3_row_1_slot_2": "l1_t3_block1",

    "l1_t3_row_2_slot_1": "l1_t3_block3",
    "l1_t3_row_2_slot_2": "l1_t3_block2",

    "l1_t3_row_3_slot_1": "l1_t3_block5",
    "l1_t3_row_3_slot_2": "l1_t3_block6"
  },

);