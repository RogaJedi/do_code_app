class LevelData {
  final String id;
  final List<String> taskIDs;
  final String levelMessage;
  final bool levelReady;

  const LevelData({
    required this.id,
    required this.taskIDs,
    required this.levelMessage,
    required this.levelReady,
  });
}


const levels = [
  LevelData(
    id: "level1",
    taskIDs: ["l1_t1", "l1_t2", "l1_t3"],
    levelMessage: 'Уровень 1\nПеременные',
    levelReady: true,
  ),
  LevelData(
    id: "level2",
    taskIDs: ["l2_t1", "l2_t2", "l2_t3"],
    levelMessage: 'Уровень 2\nМассивы',
    levelReady: true,
  ),
  LevelData(
    id: "level3",
    taskIDs: ["l3_t1", "l3_t2", "l3_t3"],
    levelMessage: 'Уровень 3\nУсловия',
    levelReady: false,
  ),
  LevelData(
    id: "level4",
    taskIDs: ["l4_t1", "l4_t2", "l4_t3"],
    levelMessage: 'Уровень 4\nЦиклы',
    levelReady: false,
  ),
];