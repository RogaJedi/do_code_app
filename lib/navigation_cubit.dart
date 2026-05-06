import 'package:flutter_bloc/flutter_bloc.dart';

import 'levels_list_state.dart';

enum AppPage { levels, achievements, user }


class NavigationCubit extends Cubit<AppPage> {
  NavigationCubit() : super(AppPage.levels);

  void setPage(AppPage page) => emit(page);
}

class LevelsNavigationCubit extends Cubit<LevelViewState> {
  LevelsNavigationCubit() : super(LevelsListState());

  void openLevels() => emit(LevelsListState());

  void openLevel(int levelIndex) {
    emit(LevelDetailState(levelIndex));
  }

  void openTask(int levelIndex, int taskIndex) {
    emit(TaskDetailState(levelIndex, taskIndex));
  }
}