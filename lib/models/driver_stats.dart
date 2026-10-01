class DriverStats {
  final int gpRaces;
  final int gpPoints;
  final int gpWins;
  final int gpPodiums;
  final int gpPoles;
  final int gpTop10s;
  final int fastestLaps;
  final int dnfsSeason;
  final int sprintRaces;
  final int sprintPoints;
  final int sprintWins;
  final int sprintPodiums;
  final int sprintPoles;
  final int sprintTop10s;


  final int careerGpEntered;
  final double careerPoints;
  final String highestRaceFinish;
  final int careerPodiums;
  final String highestGridPosition;
  final int polePositions;
  final int worldChampionships;
  final int careerDnfs;

  const DriverStats({
    required this.gpRaces,
    required this.gpPoints,
    required this.gpWins,
    required this.gpPodiums,
    required this.gpPoles,
    required this.gpTop10s,
    required this.fastestLaps,
    required this.dnfsSeason,
    required this.sprintRaces,
    required this.sprintPoints,
    required this.sprintWins,
    required this.sprintPodiums,
    required this.sprintPoles,
    required this.sprintTop10s,
    required this.careerGpEntered,
    required this.careerPoints,
    required this.highestRaceFinish,
    required this.careerPodiums,
    required this.highestGridPosition,
    required this.polePositions,
    required this.worldChampionships,
    required this.careerDnfs,
  });
}