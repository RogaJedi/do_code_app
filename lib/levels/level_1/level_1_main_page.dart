import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../navigation_cubit.dart';
import '../../widgets/custom_arcade_button.dart';

Widget TaskButton(String number, Function() function, bool taskState) {
  return CustomArcadeButton(
    onTap: function,
    mainColor: taskState ? Color(0xFF2d9400) : Color(0xFF444444),
    shadowColor: taskState ? Color(0xFF1b5800) : Color(0xFF222222),
    width: 100,
    height: 100,
    icon: Icon(Icons.star_rounded, color: Colors.white, size: 50,),
  );
}

class Level1MainPage extends StatelessWidget {

  const Level1MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LevelsNavigationCubit, LevelPage>(
            builder: (context, page)
            {
              return Center(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Уровень 1\nПеременные", style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
                        SizedBox(height: 120,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TaskButton("1", () {}, true),
                            SizedBox(width: 20,),
                            TaskButton("2", () {}, false),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TaskButton("3", () {}, false),
                            SizedBox(width: 20,),
                            TaskButton("4", () {}, false),
                          ],
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
                    ),
                  )
              );
            }
        )
    );
  }
}