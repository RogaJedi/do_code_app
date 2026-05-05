class LevelData {
  final String id;
  final List<String> taskIDs;

  const LevelData({
    required this.id,
    required this.taskIDs,
  });
}


const levels = [
  LevelData(
    id: "level1",
    taskIDs: ["l1_t1", "l1_t2", "l1_t3"],
  ),
  LevelData(
    id: "level2",
    taskIDs: ["l2_t1", "l2_t2", "l2_t3"],
  ),
  LevelData(
    id: "level3",
    taskIDs: ["l3_t1", "l3_t2", "l3_t3"],
  ),
  LevelData(
    id: "level4",
    taskIDs: ["l4_t1", "l4_t2", "l4_t3"],
  ),
];