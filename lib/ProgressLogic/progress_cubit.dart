import 'package:do_code/ProgressLogic/progress_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'achievement_data.dart';
import 'hive_service.dart';
import 'level_data.dart';

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

  void completeTask(String taskID) {
    hive.completeTask(taskID);

    final updatedTasks = Map<String, bool>.from(state.tasks);
    updatedTasks[taskID] = true;

    final updatedLevels = Map<String, bool>.from(state.levels);

    final updatedAchievements = Map<String, bool>.from(state.achievements);

    for (final level in levels) {
      if (level.taskIDs.contains(taskID)) {
        final allDone = level.taskIDs.every(
              (id) => updatedTasks[id] == true,
        );

        if (allDone) {
          hive.completeLevel(level.id);
          updatedLevels[level.id] = true;

          for (final achievement in achievements) {
            if (achievement.type == AchievementType.level &&
                achievement.levelID == level.id &&
                updatedAchievements[achievement.id] != true) {

              hive.giveAchievement(achievement.id);
              updatedAchievements[achievement.id] = true;
            }
          }
        }
      }
    }

    if (updatedAchievements['firstSteps'] != true) {
      hive.giveAchievement('firstSteps');
      updatedAchievements['firstSteps'] = true;
    }

    emit(state.copyWith(
      tasks: updatedTasks,
      levels: updatedLevels,
      achievements: updatedAchievements,
    ));
  }

  bool isTaskCompleted(String taskID) {
    return state.tasks[taskID] == true;
  }

  bool isTaskAvailable(String taskID, List<String> orderedTasks) {
    final index = orderedTasks.indexOf(taskID);

    if (index == -1) return false;
    if (index == 0) return true;

    return state.tasks[orderedTasks[index - 1]] == true;
  }

  void giveAchievement(String id) {
    if (state.achievements[id] == true) return;

    hive.giveAchievement(id);

    final updated = Map<String, bool>.from(state.achievements);
    updated[id] = true;

    emit(state.copyWith(achievements: updated));
  }

  bool gotAchievement(String achievementID) {
    return state.achievements[achievementID] == true;
  }

  void resetProgress() {
    hive.clearAll();

    emit(const ProgressState(
      tasks: {},
      levels: {},
      achievements: {},
    ));
  }
}