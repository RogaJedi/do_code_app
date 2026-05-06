import 'package:do_code/ProgressLogic/progress_cubit.dart';
import 'package:do_code/ProgressLogic/progress_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_arcade_button.dart';

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

                      ProgressButton('firstSteps', () {}, "Первые шаги"),
                      SizedBox(height: 20,),

                      ProgressButton('varMaster', () {}, "Знаток переменных"),
                      SizedBox(height: 20,),

                      ProgressButton('arrayMaster', () {}, "Знаток массивов"),
                      SizedBox(height: 20,),

                      ProgressButton('subscription', () {}, "Серьёзные намерения"),
                    ],
                  ),
                )
            );
          }
      )
    );
  }
}