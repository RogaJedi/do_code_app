import '../../widgets/forTasks/constructor/row_item.dart';
import '../../widgets/forTasks/constructor/task_data.dart';

const level_1_task2 = TaskData(

  id: "l1_t2",

  rows: [
    TaskRowData([
      RowItem.drop("l1_t2_row_1_slot_1"),
      RowItem.text("a="),
      RowItem.drop("l1_t2_row_1_slot_2"),
    ]),
    TaskRowData([
      RowItem.drop("l1_t2_row_2_slot_1"),
      RowItem.text("b="),
      RowItem.drop("l1_t2_row_2_slot_2"),
    ]),
    TaskRowData([
      RowItem.drop("l1_t2_row_3_slot_1"),
      RowItem.text("c="),
      RowItem.drop("l1_t2_row_3_slot_2"),
    ]),
  ],

  blocks: [
    BlockData(id: "l1_t2_block1", label: "int", colorIndex: 0),
    BlockData(id: "l1_t2_block2", label: "double", colorIndex: 1),
    BlockData(id: "l1_t2_block3", label: "string", colorIndex: 2),
    BlockData(id: "l1_t2_block4", label: "22", colorIndex: 3),
    BlockData(id: "l1_t2_block5", label: "7.5", colorIndex: 4),
    BlockData(id: "l1_t2_block6", label: "\"Да\"", colorIndex: 5)
  ],

  explanationTexts: ['lorem ipsum'],
  taskText: 'lorem ipsum',

  successText: 'good',
  failText: 'bad',

  correctAnswers: {
    "l1_t2_row_1_slot_1": "l1_t2_block1",
    "l1_t2_row_1_slot_2": "l1_t2_block4",

    "l1_t2_row_2_slot_1": "l1_t2_block2",
    "l1_t2_row_2_slot_2": "l1_t2_block5",

    "l1_t2_row_3_slot_1": "l1_t2_block3",
    "l1_t2_row_3_slot_2": "l1_t2_block6"
  },

);