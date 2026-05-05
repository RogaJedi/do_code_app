class ProgressState {
  final Map<String, bool> tasks;
  final Map<String, bool> levels;
  final Map<String, bool> achievements;
  final bool firstSteps;

  const ProgressState({
    required this.tasks,
    required this.levels,
    required this.achievements,
    required this.firstSteps
  });

  ProgressState copyWith({
    Map<String, bool>? tasks,
    Map<String, bool>? levels,
    Map<String, bool>? achievements,
    bool? firstSteps,
  }) {
    return ProgressState(
      tasks: tasks ?? this.tasks,
      levels: levels ?? this.levels,
      achievements: achievements ?? this.achievements,
      firstSteps: firstSteps ?? this.firstSteps
    );
  }
}