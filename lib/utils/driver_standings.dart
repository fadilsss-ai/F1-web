import '../data/driver_data.dart';
import '../data/team_data.dart';
import '../models/driver.dart';

List<Driver> driversRankedByPoints() {
  return [...kDrivers]..sort((a, b) => b.points.compareTo(a.points));
}

int driverStandingPosition(Driver driver) {
  final ranked = driversRankedByPoints();
  return ranked.indexWhere((d) => d.name == driver.name) + 1;
}

List<Driver> driversInOfficialGridOrder() {
  final orderedTeams = [...kTeams]..sort((a, b) => b.seasonPoints.compareTo(a.seasonPoints));
  final ordered = <Driver>[];
  for (final team in orderedTeams) {
    final teammates = kDrivers.where((d) => d.team == team.name).toList()
      ..sort((a, b) => b.points.compareTo(a.points));
    ordered.addAll(teammates);
  }
  return ordered;
}

String ordinalLabel(int position) {
  String suffix;
  if (position == 1) {
    suffix = 'ST';
  } else if (position == 2) {
    suffix = 'ND';
  } else if (position == 3) {
    suffix = 'RD';
  } else {
    suffix = 'TH';
  }
  return '$position$suffix';
}