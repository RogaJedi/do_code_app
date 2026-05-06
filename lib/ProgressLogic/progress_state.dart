import '../widgets/forTasks/constructor/task_data.dart';

class ProgressState {
  final Map<String, bool> tasks;
  final Map<String, bool> levels;
  final Map<String, bool> achievements;

  final Map<String, BlockData> placedBlocks;

  const ProgressState({
    required this.tasks,
    required this.levels,
    required this.achievements,
    required this.placedBlocks,
  });

  ProgressState copyWith({
    Map<String, bool>? tasks,
    Map<String, bool>? levels,
    Map<String, bool>? achievements,
    Map<String, BlockData>? placedBlocks,
  }) {
    return ProgressState(
      tasks: tasks ?? this.tasks,
      levels: levels ?? this.levels,
      achievements: achievements ?? this.achievements,
      placedBlocks: placedBlocks ?? this.placedBlocks,
    );
  }
}