import 'package:do_code/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_arcade_button.dart';

class LevelsPage extends StatelessWidget {

  const LevelsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LevelsNavigationCubit, LevelPage>(
          builder: (context, page) {
            return Center(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Вперёд к знаниям!", style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
                      SizedBox(height: 20,),
                      CustomArcadeButton(
                          onTap: () { context.read<LevelsNavigationCubit>().setLevelPage(LevelPage.level_1); },
                          mainColor: Color(0xFF232696),
                          shadowColor: Color(0xFF11134b),
                          width: 220,
                          height: 100,
                          text: "Уровень 1\nПеременные",
                          textColor: Colors.white,
                          fontSize: 25
                      ),
                      SizedBox(height: 20,),
                      CustomArcadeButton(
                          onTap: () { context.read<LevelsNavigationCubit>().setLevelPage(LevelPage.level_2); },
                          mainColor: Color(0xFF232696),
                          shadowColor: Color(0xFF11134b),
                          width: 220,
                          height: 100,
                          text: "Уровень 2\nМассивы",
                          textColor: Colors.white,
                          fontSize: 25
                      ),
                      SizedBox(height: 20,),
                      CustomArcadeButton(
                          onTap: () {},
                          mainColor: Color(0xFF444444),
                          shadowColor: Color(0xFF222222),
                          width: 220,
                          height: 100,
                          text: "Уровень 3\nУсловия",
                          textColor: Colors.white,
                          fontSize: 25
                      ),
                      SizedBox(height: 20,),
                      CustomArcadeButton(
                          onTap: () {},
                          mainColor: Color(0xFF444444),
                          shadowColor: Color(0xFF222222),
                          width: 220,
                          height: 100,
                          text: "Уровень 4\nЦиклы",
                          textColor: Colors.white,
                          fontSize: 25
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


/*
Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Вперёд к знаниям!", style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                CustomArcadeButton(
                    onTap: () {},
                    mainColor: Color(0xFF232696),
                    shadowColor: Color(0xFF11134b),
                    width: 220,
                    height: 100,
                    text: "Уровень 1\nПеременные",
                    textColor: Colors.white,
                    fontSize: 25
                ),
                SizedBox(height: 20,),
                CustomArcadeButton(
                    onTap: () {},
                    mainColor: Color(0xFF232696),
                    shadowColor: Color(0xFF11134b),
                    width: 220,
                    height: 100,
                    text: "Уровень 2\nМассивы",
                    textColor: Colors.white,
                    fontSize: 25
                ),
                SizedBox(height: 20,),
                CustomArcadeButton(
                    onTap: () {},
                    mainColor: Color(0xFF444444),
                    shadowColor: Color(0xFF222222),
                    width: 220,
                    height: 100,
                    text: "Уровень 3\nУсловия",
                    textColor: Colors.white,
                    fontSize: 25
                ),
                SizedBox(height: 20,),
                CustomArcadeButton(
                    onTap: () {},
                    mainColor: Color(0xFF444444),
                    shadowColor: Color(0xFF222222),
                    width: 220,
                    height: 100,
                    text: "Уровень 4\nЦиклы",
                    textColor: Colors.white,
                    fontSize: 25
                )
              ],
            ),
          )
      ),
 */