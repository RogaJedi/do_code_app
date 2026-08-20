import 'package:do_code/ProgressLogic/level_data.dart';
import 'package:do_code/ProgressLogic/progress_cubit.dart';
import 'package:do_code/ProgressLogic/progress_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation_cubit.dart';
import '../widgets/custom_arcade_button.dart';

Widget TaskStar(bool isCompleted, double size) {

  final taskCompletedColor = Color(0xFFFF9300);

  return Icon(
    Icons.star_rounded,
    size: size,
    color: isCompleted ? taskCompletedColor : Colors.white,
  );
}

Widget TripleTaskStar(bool isCompleted) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TaskStar(isCompleted, 50),
      TaskStar(isCompleted, 70),
      TaskStar(isCompleted, 50)
    ],
  );
}

Widget TaskButton(
    int levelID,
    int taskID,
    ) {
  return BlocBuilder<ProgressCubit, ProgressState>(
    builder: (context, state) {

      final tasks = levels[levelID].taskIDs;
      final cubit = context.read<ProgressCubit>();
      final isCompleted = cubit.isTaskCompleted(tasks[taskID]);
      final isAvailable = cubit.isTaskAvailable(tasks[taskID], tasks);

      return CustomArcadeButton(
        onTap: isAvailable
            ? () { context.read<LevelsNavigationCubit>().openTask(levelID, taskID); }
            : () {},
        mainColor: isAvailable
            ? const Color(0xFF2d9400)
            : const Color(0xFF444444),
        shadowColor: isAvailable
            ? const Color(0xFF1b5800)
            : const Color(0xFF222222),
        width: taskID != 2 ? 100 : 220,
        height: 100,
        icon: taskID != 2
            ? TaskStar(isCompleted, 50)
            : TripleTaskStar(isCompleted)
      );
    },
  );
}


Widget ReturnButton(BuildContext context) {
  return CustomArcadeButton(
    onTap: () {
      context.read<LevelsNavigationCubit>().openLevels();
    },
    mainColor: const Color(0xFF5118B1),
    shadowColor: const Color(0xFF300e6a),
    width: 220,
    height: 100,
    text: "Вернуться",
    fontSize: 35,
    textColor: Colors.white,
  );
}


class SelectedLevelPage extends StatelessWidget {

  final int levelID;

  const SelectedLevelPage({
    super.key,
    required this.levelID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SafeArea(
                child: levels[levelID].levelReady

                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      levels[levelID].levelMessage,
                      style: TextStyle(fontSize: 50),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 120,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TaskButton(levelID, 0),
                        SizedBox(width: 20,),
                        TaskButton(levelID, 1),
                      ],
                    ),
                    SizedBox(height: 20,),
                    TaskButton(levelID, 2),

                    SizedBox(height: 60,),
                    ReturnButton(context)
                  ],
                )

                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Этот уровень\nв разработке,\nно скоро\nбудет готов!",
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 60,),
                    ReturnButton(context)
                  ],
                )

            )
        )
    );
  }
}