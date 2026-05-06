import 'package:do_code/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_arcade_button.dart';

Widget LevelSelectButton(
    Function() onTap,
    String text,
    ) {
  return CustomArcadeButton(
    onTap: onTap,
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
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Вперёд к знаниям!",
                style: TextStyle(fontSize: 50),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              LevelSelectButton(
                    () => context.read<LevelsNavigationCubit>().openLevel(0),
                "Уровень 1\nПеременные",
              ),
              const SizedBox(height: 20),

              LevelSelectButton(
                    () => context.read<LevelsNavigationCubit>().openLevel(1),
                "Уровень 2\nМассивы",
              ),
              const SizedBox(height: 20),

              LevelSelectButton(
                    () => context.read<LevelsNavigationCubit>().openLevel(2),
                "Уровень 3\nУсловия",
              ),
              const SizedBox(height: 20),

              LevelSelectButton(
                    () => context.read<LevelsNavigationCubit>().openLevel(3),
                "Уровень 4\nЦиклы",
              ),
            ],
          ),
        ),
      ),
    );
  }
}