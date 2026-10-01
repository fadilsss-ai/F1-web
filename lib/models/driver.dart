import 'package:flutter/material.dart';
import 'driver_stats.dart';


class Driver {
  final String name;
  final String team;
  final String imagePath;
  final Color teamColor;
  final String number;
  final String countryFlag; 
  final String nationalityCode; 
  final int points; 
  final String lastRace; 
  final String? badge; 
  final DriverStats stats; 

  const Driver({
    required this.name,
    required this.team,
    required this.imagePath,
    required this.teamColor,
    required this.number,
    required this.countryFlag,
    required this.nationalityCode,
    required this.points,
    required this.lastRace,
    this.badge,
    required this.stats,
  });
}


