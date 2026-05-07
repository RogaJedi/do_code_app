import 'package:do_code/widgets/custom_arcade_button.dart';
import 'package:flutter/material.dart';

import '../custom_arcade_popup.dart';
import 'constructor/task_data.dart';


Widget PopupIconButton(Widget icon, Function() onTap) {
  return CustomArcadeButton(
      onTap: onTap,
      mainColor: Color(0xFF2d9400),
      shadowColor: Color(0xFF1b5800),
    width: 80,
    height: 60,
    icon: icon,
  );
}

Widget PopupTextButton(String text, Function() onTap) {
  return CustomArcadeButton(
      onTap: onTap,
      mainColor: Color(0xFF2d9400),
      shadowColor: Color(0xFF1b5800),
    width: 80,
    height: 60,
    text: text,
    textColor: Colors.white,
    fontSize: 20,
  );
}


class TaskExplainPopup extends StatefulWidget {
  final TaskData task;

  const TaskExplainPopup({
    super.key,
    required this.task,
  });

  @override
  State<TaskExplainPopup> createState() =>
      _TaskExplainPopupState();
}

class _TaskExplainPopupState
    extends State<TaskExplainPopup> {

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    final pages = [
      ...widget.task.explanationTexts,
      widget.task.taskText,
    ];

    return CustomArcadePopup(
      content: pages[currentPage],

      actions: [

        if (currentPage > 0)
          PopupIconButton(
            Icon(
              Icons.arrow_left_rounded,
              color: Colors.white,
              size: 60,
            ),
            () {
              setState(() {
                currentPage--;
              });
            },
          ),

        if (currentPage < pages.length - 1)
          PopupIconButton(
            Icon(
              Icons.arrow_right_rounded,
              color: Colors.white,
              size: 60,
            ),
            () {
              setState(() {
                currentPage++;
              });
            },
          ),

        if (currentPage == pages.length - 1)
          PopupTextButton(
            "OK",
            () {
              Navigator.pop(context);
            },
          ),
      ],
    );
  }
}