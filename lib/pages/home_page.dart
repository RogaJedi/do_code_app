import 'package:do_code/levels/levels_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../levels/selected_level_page.dart';
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
                  return SelectedLevelPage(levelID: 0, levelMessage: 'Уровень 1\nПеременные', levelReady: true,);
                case LevelPage.level_2:
                  return SelectedLevelPage(levelID: 1, levelMessage: 'Уровень 2\nМассивы', levelReady: true,);
                case LevelPage.level_3:
                  return SelectedLevelPage(levelID: 2, levelMessage: 'Уровень 3\nУсловия', levelReady: false,);
                case LevelPage.level_4:
                  return SelectedLevelPage(levelID: 3, levelMessage: 'Уровень 4\nЦиклы', levelReady: false,);
              }
            }
        )
    );
  }
}