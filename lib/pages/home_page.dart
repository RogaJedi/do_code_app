import 'package:do_code/levels/levels_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../levels/level_1/level_1_main_page.dart';
import '../levels/level_2/level_2_main_page.dart';
import '../navigation_cubit.dart';

class HomePage extends StatelessWidget {

  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LevelsNavigationCubit, LevelPage>(
            builder: (context, page) {
              switch (page) {
                case LevelPage.levelsPage:
                  return LevelsPage();
                case LevelPage.level_1:
                  return Level1MainPage();
                case LevelPage.level_2:
                  return Level2MainPage();
              }
            }
        )
    );
  }
}