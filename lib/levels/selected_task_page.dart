import 'package:do_code/widgets/forTasks/blocks_window.dart';
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
    final dropZoneID = entry.key;
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

void _showResultDialog(
    BuildContext context,
    bool isCorrect,
    TaskData task,
    int levelID,
    int taskID,
    ) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text(isCorrect
            ? task.texts["success"]!
            : task.texts["fail"]!),

        actions: isCorrect
            ? [
          TextButton(
            onPressed: () {
              context.read<ProgressCubit>().completeTask(task.id);

              Navigator.pop(context); // close dialog
              context.read<LevelsNavigationCubit>().openLevel(levelID);
            },
            child: const Text("Продолжить"),
          ),
        ]
            : [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Попробовать снова"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close main dialog

              _showAnswerDialog(context, task);
            },
            child: const Text("Показать ответ"),
          ),
        ],
      );
    },
  );
}

void _showAnswerDialog(BuildContext context, TaskData task) {
  final explanation = buildAnswerExplanation(task);

  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text("Ответ"),
        content: Text(explanation),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("ОК"),
          ),
        ],
      );
    },
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
                          onTap: () {},
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
                    height: 60,
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