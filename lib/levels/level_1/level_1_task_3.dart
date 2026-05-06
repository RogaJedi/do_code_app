import '../../widgets/forTasks/constructor/row_item.dart';
import '../../widgets/forTasks/constructor/task_data.dart';

const level_1_task3 = TaskData(

  id: "l1_t3",

  rows: [
    TaskRowData([
      RowItem.drop("l1_t3_row1_slot"),
      RowItem.text("a"),
    ]),
    TaskRowData([
      RowItem.drop("l1_t3_row2_slot"),
      RowItem.text("b"),
    ]),
    TaskRowData([
      RowItem.drop("l1_t3_row3_slot"),
      RowItem.text("c"),
    ]),
  ],

  blocks: [
    BlockData(id: "l1_t3_block1", label: "int", colorIndex: 0),
    BlockData(id: "l1_t3_block2", label: "double", colorIndex: 1),
    BlockData(id: "l1_t3_block3", label: "string", colorIndex: 2)
  ],

  texts: {
    "title": "Задание",
    "success": "Отлично! 🎉",
    "fail": "Похоже, есть ошибка",
  },

  correctAnswers: {
    "l1_t3_row1_slot": "l1_t3_block1",
    "l1_t3_row2_slot": "l1_t3_block2",
    "l1_t3_row3_slot": "l1_t3_block3",
  },

);