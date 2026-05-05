import 'package:flutter_bloc/flutter_bloc.dart';

enum AppPage { levels, achievements, user }

enum LevelPage { levelsPage, level_1, level_2, level_3, level_4 }

class NavigationCubit extends Cubit<AppPage> {
  NavigationCubit() : super(AppPage.levels);

  void setPage(AppPage page) => emit(page);
}

class LevelsNavigationCubit extends Cubit<LevelPage> {
  LevelsNavigationCubit() : super(LevelPage.levelsPage);

  void setLevelPage(LevelPage page) => emit(page);
}