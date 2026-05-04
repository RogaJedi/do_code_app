class ProgressState {
  final Map<String, bool> tasks;
  final Map<String, bool> levels;
  final Map<String, bool> achievements;

  const ProgressState({
    required this.tasks,
    required this.levels,
    required this.achievements,
  });

  ProgressState copyWith({
    Map<String, bool>? tasks,
    Map<String, bool>? levels,
    Map<String, bool>? achievements,
  }) {
    return ProgressState(
      tasks: tasks ?? this.tasks,
      levels: levels ?? this.levels,
      achievements: achievements ?? this.achievements,
    );
  }
}