

import 'package:hive_flutter/adapters.dart';

class HiveService {
  final Box box;

  HiveService(this.box);

  bool _isCompleted(String key, String id) {
    final data = box.get(key, defaultValue: <String, bool>{});
    return data[id] ?? false;
  }

  void _setCompleted(String key, String id) {
    final current = box.get(key, defaultValue: <String, bool>{});
    final updated = Map<String, bool>.from(current);

    updated[id] = true;

    box.put(key, updated);
  }

  // Tasks
  bool isTaskCompleted(String id) => _isCompleted('tasks', id);
  void completeTask(String id) => _setCompleted('tasks', id);

  // Levels
  bool isLevelCompleted(String id) => _isCompleted('levels', id);
  void completeLevel(String id) => _setCompleted('levels', id);

  // Achievements
  bool isAchievementAcquired(String id) => _isCompleted('achievements', id);
  void giveAchievement(String id) => _setCompleted('achievements', id);

  bool areAllTasksCompleted(List<String> taskIDs) {
    final tasks = box.get('tasks', defaultValue: <String, bool>{});

    for (final id in taskIDs) {
      if (tasks[id] != true) {
        return false;
      }
    }

    return true;
  }

  void clearAll() {
    box.clear();
  }


}