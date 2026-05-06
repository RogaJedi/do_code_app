enum AchievementType {
  task,
  level,
  subscription,
  custom,
}

class AchievementData {
  final String id;
  final AchievementType type;

  final String? levelID;

  const AchievementData({
    required this.id,
    required this.type,
    this.levelID,
  });
}


const achievements = [
  AchievementData(
    id: 'firstSteps',
    type: AchievementType.task,
  ),
  AchievementData(
    id: 'varMaster',
    type: AchievementType.level,
    levelID: 'level1',
  ),
  AchievementData(
    id: 'arrayMaster',
    type: AchievementType.level,
    levelID: 'level2',
  ),
  AchievementData(
      id: 'conMaster',
      type: AchievementType.level,
      levelID: 'level3'
  ),
  AchievementData(
      id: 'loopMaster',
      type: AchievementType.level,
      levelID: 'level4'

  ),
  AchievementData(
    id: 'subscription',
    type: AchievementType.subscription,
  ),
];