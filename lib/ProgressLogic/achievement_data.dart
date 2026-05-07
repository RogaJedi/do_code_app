enum AchievementType {
  task,
  level,
  subscription,
  custom,
}

class AchievementData {
  final String id;
  final AchievementType type;
  final String condition;

  final String? levelID;

  const AchievementData({
    required this.id,
    required this.type,
    this.levelID,
    required this.condition,
  });
}


const achievements = [
  AchievementData(
      id: 'firstSteps',
      type: AchievementType.task,
      condition: "Выполните одно задание любого уровня."
  ),
  AchievementData(
      id: 'varMaster',
      type: AchievementType.level,
      levelID: 'level1',
      condition: "Успешно завершите первый уровень."
  ),
  AchievementData(
      id: 'arrayMaster',
      type: AchievementType.level,
      levelID: 'level2',
      condition: "Успешно завершите второй уровень."

  ),
  AchievementData(
      id: 'conMaster',
      type: AchievementType.level,
      levelID: 'level3',
      condition: "Успешно завершите третий уровень."
  ),
  AchievementData(
      id: 'loopMaster',
      type: AchievementType.level,
      levelID: 'level4',
      condition: "Успешно завершите четвёртый уровень."

  ),
  AchievementData(
      id: 'subscription',
      type: AchievementType.subscription,
      condition: "Зарегистрируйтесь и приобретите платную подписку."
  ),
];


final Map<String, AchievementData> achievementMap = {
  for (final achievement in achievements)
    achievement.id : achievement,
};