import 'package:do_code/ProgressLogic/progress_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'hive_service.dart';

class ProgressCubit extends Cubit<ProgressState> {
  final HiveService hive;

  ProgressCubit(this.hive)
      : super(const ProgressState(
    tasks: {},
    levels: {},
    achievements: {},
  )) {
    load();
  }

  void load() {
    emit(ProgressState(
      tasks: Map<String, bool>.from(
        hive.box.get('tasks', defaultValue: {}),
      ),
      levels: Map<String, bool>.from(
        hive.box.get('levels', defaultValue: {}),
      ),
      achievements: Map<String, bool>.from(
        hive.box.get('achievements', defaultValue: {}),
      ),
    ));
  }

  void completeTask(String taskID, {String? levelID, List<String>? levelTasks}) {
    hive.completeTask(taskID);

    final updatedTasks = Map<String, bool>.from(state.tasks);
    updatedTasks[taskID] = true;

    var updatedLevels = Map<String, bool>.from(state.levels);

    if (levelID != null && levelTasks != null) {
      final allDone = levelTasks.every(
            (id) => updatedTasks[id] == true,
      );

      if (allDone) {
        hive.completeLevel(levelID);
        updatedLevels[levelID] = true;
      }
    }

    emit(state.copyWith(
      tasks: updatedTasks,
      levels: updatedLevels,
    ));
  }

  void giveAchievement(String id) {
    if (state.achievements[id] == true) return;

    hive.giveAchievement(id);

    final updated = Map<String, bool>.from(state.achievements);
    updated[id] = true;

    emit(state.copyWith(achievements: updated));
  }
}