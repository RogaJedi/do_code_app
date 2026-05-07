import 'package:do_code/widgets/custom_arcade_popup.dart';
import 'package:do_code/widgets/forTasks/blocks_window.dart';
import 'package:do_code/widgets/forTasks/task_explain_popup.dart';
import 'package:do_code/widgets/forTasks/work_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ProgressLogic/level_data.dart';
import '../ProgressLogic/progress_cubit.dart';
import '../navigation_cubit.dart';
import '../widgets/custom_arcade_button.dart';
import '../widgets/forTasks/constructor/task_data.dart';


String buildAnswerExplanation(TaskData task) {
  final buffer = StringBuffer();

  int i = 1;

  for (final entry in task.correctAnswers.entries) {
    final correctBlockID = entry.value;

    final block = task.blocks.firstWhere(
          (b) => b.id == correctBlockID,
    );

    buffer.writeln(
      "В строке $i: ${block.label}",
    );

    i++;
  }

  return buffer.toString();
}

Widget PopupButton({
  required String text,
  required VoidCallback onTap,
}) {
  return CustomArcadeButton(
    onTap: onTap,
    mainColor: const Color(0xFF5118B1),
    shadowColor: const Color(0xFF300e6a),
    width: 140,
    height: 60,
    text: text,
    textColor: Colors.white,
    fontSize: 25,
  );
}

void _showResultDialog(
    BuildContext context,
    bool isCorrect,
    TaskData task,
    int levelID,
    int taskID,
    ) {
  showGameDialog(
    context: context,

    child: CustomArcadePopup(
      content: isCorrect
          ? task.successText
          : task.failText,

      actions: isCorrect

          ? [
        PopupButton(
          text: "Далее",
          onTap: () {

            context
                .read<ProgressCubit>()
                .completeTask(task.id);

            Navigator.pop(context);

            context
                .read<LevelsNavigationCubit>()
                .openLevel(levelID);
          },
        ),
      ]

          : [
        PopupButton(
          text: "Назад",
          onTap: () {
            Navigator.pop(context);
          },
        ),

        PopupButton(
          text: "Ответ",
          onTap: () {

            Navigator.pop(context);

            _showAnswerDialog(
              context,
              task,
            );
          },
        ),
      ],
    ),
  );
}

void _showAnswerDialog(
    BuildContext context,
    TaskData task,
    ) {

  final explanation =
  buildAnswerExplanation(task);

  showGameDialog(
    context: context,

    child: CustomArcadePopup(
      content: explanation,

      actions: [
        PopupButton(
          text: "OK",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}


Widget TaskReturnButton(BuildContext context, int levelIndex) {
  return CustomArcadeButton(
    onTap: () {
      context.read<LevelsNavigationCubit>().openLevel(levelIndex);
    },
    mainColor: const Color(0xFF5118B1),
    shadowColor: const Color(0xFF300e6a),
    width: 120,
    height: 80,
    icon: Icon(Icons.keyboard_return_rounded, color: Colors.white, size: 50,),
  );
}


Widget AreaDivider() {
  return Divider(
    thickness: 5,
    color: Color(0xFFa5a5a5),
    radius: BorderRadius.circular(10),
    indent: 40,
    endIndent: 40,
  );
}

class SelectedTaskPage extends StatelessWidget {
  final int levelID;
  final int taskID;

  const SelectedTaskPage({
    super.key,
    required this.levelID,
    required this.taskID
  });

  @override
  Widget build(BuildContext context) {

    final taskKey = levels[levelID].taskIDs[taskID];
    final taskData = taskMap[taskKey]!;

    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TaskReturnButton(context, levelID),
                      SizedBox(width: 10,),
                      CustomArcadeButton(
                          onTap: () {
                            showGameDialog(
                              context: context,
                              child: TaskExplainPopup(
                                task: taskData,
                              ),
                            );
                          },
                          mainColor: Color(0xFF2d9400),
                          shadowColor: Color(0xFF1b5800),
                          width: 250,
                          height: 80,
                          text: "Задание",
                          textColor: Colors.white,
                          fontSize: 35
                      )
                    ],
                  ),
                  SizedBox(height: 10,),

                  WorkWindow(context, taskData),
                  AreaDivider(),

                  BlocksWindow(context, taskData),
                  SizedBox(height: 10,),

                  CustomArcadeButton(
                    onTap: () {
                      final cubit = context.read<ProgressCubit>();
                      final isCorrect = cubit.validateTask(taskData);

                      _showResultDialog(context, isCorrect, taskData, levelID, taskID);
                    },
                    mainColor: Color(0xFF00E5DC),
                    shadowColor: Color(0xFF008984),
                    width: 250,
                    height: 70,
                    text: "Проверить",
                    textColor: Colors.white,
                    fontSize: 35,
                  )
                ],
              )
          ),
      )
    );
  }
}