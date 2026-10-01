import 'package:flutter/material.dart';
class TeamSeasonStats {
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

  const TeamSeasonStats({
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
  });
}

class TeamSummaryStats {
  final int grandsPrixEntered;
  final double teamPoints;
  final String highestRaceFinish;
  final int podiums;
  final String highestGridPosition;
  final int polePositions;
  final int worldChampionships;

  const TeamSummaryStats({
    required this.grandsPrixEntered,
    required this.teamPoints,
    required this.highestRaceFinish,
    required this.podiums,
    required this.highestGridPosition,
    required this.polePositions,
    required this.worldChampionships,
  });
}

class Team {
  final String name;
  final Color teamColor;
  final String imagePath;
  final String chassis;
  final String engineSupplier;
  final String description;
  final int seasonPoints; 
  final TeamSeasonStats seasonStats;
  final TeamSummaryStats summaryStats;

  const Team({
    required this.name,
    required this.teamColor,
    required this.imagePath,
    required this.chassis,
    required this.engineSupplier,
    required this.description,
    required this.seasonPoints,
    required this.seasonStats,
    required this.summaryStats,
  });
}

