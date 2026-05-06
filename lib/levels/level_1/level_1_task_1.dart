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

  texts: {
    "explain_text_1": "Переменные похожи"
        "\nна коробки. В каждой"
        "\nхранится какая-то информация."
        "\nА ещё у переменных есть типы."
        "\nОни похожи на записи на"
        "\nкоробках, чтоб было понятно"
        "\nчто в какой коробке лежит.",

    "explain_text_2": "Если переменная хранит целые числа,"
        "\nто есть те, которыми можно что-то посчитать,"
        "\nто её тип будет \"int\".",

    "explain_text_3": "\nЕсли же нужно хранить числа поточнее,"
        "\nкак например цены на товары,"
        "\nкоторые обычно пишутся через точку,"
        "\nто её тип будет \"double\".",

    "explain_text_4": "Ну а если в переменной хранится"
        "\nкакой-либо текст, как например сообщение,"
        "\nто её тип будет \"string\".",

    "success": "Отлично!",
    "fail": "Похоже, есть ошибка",
  },

    correctAnswers: {
      "l1_t1_row1_slot": "l1_t1_block1",
      "l1_t1_row2_slot": "l1_t1_block2",
      "l1_t1_row3_slot": "l1_t1_block3",
    },

);