import '../../widgets/forTasks/constructor/row_item.dart';
import '../../widgets/forTasks/constructor/task_data.dart';

const level_1_task1 = TaskData(

  id: "l1_t1",

  rows: [
    TaskRowData([
      RowItem.drop("l1_t1_row1_slot"),
      RowItem.text("a"),
    ]),
    TaskRowData([
      RowItem.drop("l1_t1_row2_slot"),
      RowItem.text("b"),
    ]),
    TaskRowData([
      RowItem.drop("l1_t1_row3_slot"),
      RowItem.text("c"),
    ]),
  ],

  blocks: [
    BlockData(id: "l1_t1_block1", label: "int", colorIndex: 0),
    BlockData(id: "l1_t1_block2", label: "double", colorIndex: 1),
    BlockData(id: "l1_t1_block3", label: "string", colorIndex: 2)
  ],


  explanationTexts: [

    "Переменные похожи "
        "на коробки. В каждой "
        "хранится какая-то информация. "
        "А ещё у переменных есть типы. "
        "Они похожи на записи на "
        "коробках, чтоб было понятно "
        "что в какой коробке лежит.",

    "Если переменная хранит целые числа, "
        "то есть те, которыми можно что-то посчитать, "
        "то её тип будет \"int\".",

    "Если же нужно хранить числа поточнее, "
        "как например цены на товары, "
        "которые обычно пишутся через точку, "
        "то её тип будет \"double\".",

    "Ну а если в переменной хранится "
        "какой-либо текст, как например сообщение, "
        "то её тип будет \"string\".",

  ],

  taskText: "Задание. Помести правильные типы к переменным. "
      "У переменной a должен быть тип для целых чисел. "
      "У переменной b тип для точных чисел. "
      "А у переменной c тип для сообщений. ",

  successText: "Отлично!",
  failText: "Похоже, есть ошибка",

  correctAnswers: {
    "l1_t1_row1_slot": "l1_t1_block1",
    "l1_t1_row2_slot": "l1_t1_block2",
    "l1_t1_row3_slot": "l1_t1_block3",
  },

);