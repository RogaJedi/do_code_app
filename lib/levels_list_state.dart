abstract class LevelViewState {}

class LevelsListState extends LevelViewState {}

class LevelDetailState extends LevelViewState {
  final int levelIndex;

  LevelDetailState(this.levelIndex);
}

class TaskDetailState extends LevelViewState {
  final int levelIndex;
  final int taskIndex;

  TaskDetailState(this.levelIndex, this.taskIndex);
}

