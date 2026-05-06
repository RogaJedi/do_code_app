import 'package:do_code/ProgressLogic/level_data.dart';
import 'package:do_code/ProgressLogic/progress_cubit.dart';
import 'package:do_code/ProgressLogic/progress_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation_cubit.dart';
import '../widgets/custom_arcade_button.dart';

Widget TaskButton(
    String taskID,
    List<String> orderedTasks,
    Function() onTap,
    double width,
    bool triple,
    ) {
  return BlocBuilder<ProgressCubit, ProgressState>(
    builder: (context, state) {

      final cubit = context.read<ProgressCubit>();

      final isCompleted = cubit.isTaskCompleted(taskID);
      final isAvailable = cubit.isTaskAvailable(taskID, orderedTasks);

      final taskCompletedColor = Color(0xFFFF9300);

      return CustomArcadeButton(
        onTap: isAvailable ? onTap : () {},
        mainColor: isAvailable
            ? const Color(0xFF2d9400)
            : const Color(0xFF444444),
        shadowColor: isAvailable
            ? const Color(0xFF1b5800)
            : const Color(0xFF222222),
        width: width,
        height: 100,
        icon: triple ?
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rounded,
              size: 50,
              color: isCompleted ? taskCompletedColor : Colors.white,
            ),
            SizedBox(width: 0,),
            Icon(
              Icons.star_rounded,
              size: 70,
              color: isCompleted ? taskCompletedColor : Colors.white,
            ),
            SizedBox(width: 0,),
            Icon(
              Icons.star_rounded,
              size: 50,
              color: isCompleted ? taskCompletedColor : Colors.white,
            )
          ],
        )
            :
        Icon(
          Icons.star_rounded,
          size: 50,
          color: isCompleted ? taskCompletedColor : Colors.white,
        )
      );
    },
  );
}



class SelectedLevelPage extends StatelessWidget {

  final int levelID;
  final String levelMessage;
  final bool levelReady;


  const SelectedLevelPage({
    super.key,
    required this.levelID,
    required this.levelMessage,
    required this.levelReady
  });

  @override
  Widget build(BuildContext context) {

    final tasks = levels[levelID].taskIDs;

    return Scaffold(
        body: BlocBuilder<LevelsNavigationCubit, LevelPage>(
            builder: (context, page)
            {
              return Center(
                  child: SafeArea(
                    child: levelReady
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(levelMessage, style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
                        SizedBox(height: 120,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TaskButton(
                                tasks[0],
                                tasks,
                                    () { context.read<ProgressCubit>().completeTask(tasks[0]); },
                                100,
                                false
                            ),
                            SizedBox(width: 20,),
                            TaskButton(
                                tasks[1],
                                tasks,
                                    () { context.read<ProgressCubit>().completeTask(tasks[1]); },
                                100,
                                false
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        TaskButton(
                            tasks[2],
                            tasks,
                                () { context.read<ProgressCubit>().completeTask(tasks[2]); },
                            220,
                            true
                        ),

                        SizedBox(height: 60,),
                        CustomArcadeButton(
                          onTap: () { context.read<LevelsNavigationCubit>().setLevelPage(LevelPage.levelsPage); },
                          mainColor: Color(0xFF5118B1),
                          shadowColor: Color(0xFF300e6a),
                          width: 220,
                          height: 100,
                          text: "Вернуться",
                          fontSize: 35,
                          textColor: Colors.white,
                        )
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
                        CustomArcadeButton(
                          onTap: () { context.read<LevelsNavigationCubit>().setLevelPage(LevelPage.levelsPage); },
                          mainColor: Color(0xFF5118B1),
                          shadowColor: Color(0xFF300e6a),
                          width: 220,
                          height: 100,
                          text: "Вернуться",
                          fontSize: 35,
                          textColor: Colors.white,
                        )
                      ],
                    )

                  )
              );
            }
        )
    );
  }
}
/*
Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(levelMessage, style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
                        SizedBox(height: 120,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TaskButton(
                                tasks[0],
                                tasks,
                                    () { context.read<ProgressCubit>().completeTask(tasks[0]); },
                                100,
                                false
                            ),
                            SizedBox(width: 20,),
                            TaskButton(
                                tasks[1],
                                tasks,
                                    () { context.read<ProgressCubit>().completeTask(tasks[1]); },
                                100,
                                false
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        TaskButton(
                            tasks[2],
                            tasks,
                                () { context.read<ProgressCubit>().completeTask(tasks[2]); },
                            220,
                            true
                        ),

                        SizedBox(height: 60,),
                        CustomArcadeButton(
                          onTap: () { context.read<LevelsNavigationCubit>().setLevelPage(LevelPage.levelsPage); },
                          mainColor: Color(0xFF5118B1),
                          shadowColor: Color(0xFF300e6a),
                          width: 220,
                          height: 100,
                          text: "Вернуться",
                          fontSize: 35,
                          textColor: Colors.white,
                        )
                      ],
                    )
 */