import 'package:do_code/ProgressLogic/level_data.dart';
import 'package:do_code/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_arcade_button.dart';

Widget LevelSelectButton(
    BuildContext context,
    int levelId,
    String text,
    ) {
  return CustomArcadeButton(
    onTap: () => context.read<LevelsNavigationCubit>().openLevel(levelId),
    mainColor: const Color(0xFF232696),
    shadowColor: const Color(0xFF11134b),
    width: 220,
    height: 100,
    text: text,
    textColor: Colors.white,
    fontSize: 25,
  );
}

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "Вперёд к знаниям!",
              style: TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: levels.length,

                separatorBuilder: (_, __) =>
                const SizedBox(height: 20),

                itemBuilder: (context, index) {
                  final level = levels[index];

                  return Center(
                    child: LevelSelectButton(
                      context,
                      index,
                      level.levelMessage,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}