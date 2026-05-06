import 'package:do_code/levels/level_1/task_1/task_1_blocks.dart';
import 'package:do_code/levels/level_1/task_1/task_1_tasks.dart';
import 'package:do_code/widgets/forTasks/blocks_window.dart';
import 'package:do_code/widgets/forTasks/work_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation_cubit.dart';
import '../widgets/custom_arcade_button.dart';


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

                  WorkWindow(context, Task1Tasks()),
                  AreaDivider(),

                  BlocksWindow(context, Task1Blocks()),
                  SizedBox(height: 10,),

                  CustomArcadeButton(
                      onTap: () {},
                      mainColor: Color(0xFF00E5DC),
                      shadowColor: Color(0xFF008984),
                      width: 250,
                      height: 60,
                      text: "Проверить",
                      textColor: Colors.white,
                      fontSize: 35
                  )
                ],
              )
          ),
      )
    );
  }
}