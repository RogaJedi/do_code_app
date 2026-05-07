import 'package:do_code/ProgressLogic/progress_cubit.dart';
import 'package:do_code/ProgressLogic/progress_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ProgressLogic/achievement_data.dart';
import '../widgets/custom_arcade_button.dart';
import '../widgets/custom_arcade_popup.dart';



void showAchievementPopup(
    BuildContext context,
    AchievementData achievement,
    ) {
  showGameDialog(
    context: context,
    child: CustomArcadePopup(
      content: achievement.condition,
      actions: [
        CustomArcadeButton(
            onTap: () { Navigator.pop(context); },
            mainColor: Color(0xFFFF9300),
            shadowColor: Color(0xFF995800),
            width: 80,
            height: 60,
          icon: Icon(Icons.thumb_up_alt_rounded, color: Colors.white, size: 30,),
        ),
      ],
    ),
  );
}


Widget ProgressButton(String achievementID, Function() onTap, String text){
  return BlocBuilder<ProgressCubit, ProgressState>(
    builder: (context, progress) {

      final cubit = context.read<ProgressCubit>();

      final gotAchievement = cubit.gotAchievement(achievementID);

      return CustomArcadeButton(
          onTap: onTap,
          mainColor: gotAchievement
            ? Color(0xFFFF9300)
            : Color(0xFF444444),
          shadowColor: gotAchievement
            ? Color(0xFF995800)
            : Color(0xFF222222),
          width: 400,
          height: 100,
          text: text,
          textColor: Colors.white,
          fontSize: 30
      );
    }
  );
}

class ProgressPage extends StatelessWidget {

  const ProgressPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProgressCubit, ProgressState>(
          builder: (context, progress) {
            return Center(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Мой прогресс", style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
                      SizedBox(height: 20,),

                      ProgressButton(
                          'firstSteps',
                              () {
                                showAchievementPopup(
                                  context,
                                  achievementMap['firstSteps']!,
                                );
                              },
                          "Первые шаги"
                      ),
                      SizedBox(height: 20,),

                      ProgressButton(
                          'varMaster',
                              () {
                                showAchievementPopup(
                                  context,
                                  achievementMap['varMaster']!,
                                );
                              },
                        "Знаток переменных"
                      ),
                      SizedBox(height: 20,),

                      ProgressButton(
                          'arrayMaster',
                              () {
                                showAchievementPopup(
                                  context,
                                  achievementMap['arrayMaster']!,
                                );
                              },
                          "Знаток массивов"
                      ),
                      SizedBox(height: 20,),

                      ProgressButton(
                          'subscription',
                              () {
                                showAchievementPopup(
                                  context,
                                  achievementMap['subscription']!,
                                );
                              },
                          "Серьёзные намерения"
                      ),
                    ],
                  ),
                )
            );
          }
      )
    );
  }
}