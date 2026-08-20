import 'package:do_code/levels/selected_task_page.dart';
import 'package:do_code/levels/levels_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../levels/selected_level_page.dart';
import '../levels_list_state.dart';
import '../navigation_cubit.dart';

class HomePage extends StatelessWidget {

  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LevelsNavigationCubit, LevelViewState>(
            builder: (context, page) {
              if (page is LevelsListState) {
                return LevelsPage();
              } else if (page is LevelDetailState) {
                return SelectedLevelPage(levelID: page.levelIndex);
              } else if (page is TaskDetailState) {
                return SelectedTaskPage(
                  levelID: page.levelIndex,
                  taskID: page.taskIndex,
                );
              }
              return Container();
            }
        )
    );
  }
}