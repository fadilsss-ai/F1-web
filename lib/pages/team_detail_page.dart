import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/team.dart';
import '../data/driver_data.dart';
import '../data/team_data.dart';
import '../widgets/stats_panel.dart';

class TeamDetailPage extends StatelessWidget {
  final Team team;

  const TeamDetailPage({super.key, required this.team});

  String get _seasonPositionLabel {
    final ranked = [...kTeams]..sort((a, b) => b.seasonPoints.compareTo(a.seasonPoints));
    final rank = ranked.indexWhere((t) => t.name == team.name) + 1;
    String suffix;
    if (rank == 1) {
      suffix = 'ST';
    } else if (rank == 2) {
      suffix = 'ND';
    } else if (rank == 3) {
      suffix = 'RD';
    } else {
      suffix = 'TH';
    }
    return '$rank$suffix';
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final drivers = kDrivers.where((d) => d.team == team.name).toList();
    final stats = team.seasonStats;
    final summary = team.summaryStats;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: team.imagePath,
                    child: Image.asset(
                      team.imagePath,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 100,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black.withValues(alpha: 0.45), Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 4,
                    child: SafeArea(
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: SafeArea(
                      top: false,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.55),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: team.teamColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        team.chassis,
                                        style: const TextStyle(
                                          fontFamily: 'BebasNeue',
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        team.name.toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'BebasNeue',
                                          fontSize: 18,
                                          letterSpacing: 0.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                for (final driver in drivers)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Row(
                                      children: [
                                        ClipOval(
                                          child: Image.asset(
                                            driver.imagePath,
                                            width: 22,
                                            height: 22,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          driver.name,
                                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Icon(Icons.keyboard_arrow_up, color: Colors.white24),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                    width: double.infinity,
                    child: CustomPaint(painter: _StatsStripePainter()),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'STATISTICS',
                    style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 30,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final seasonCard = StatsPanel(
                        title: '2026 SEASON',
                        buttonLabel: 'Full Season Results',
                        child: StatPairGrid(pairs: [
                          [StatItem(label: 'Grand Prix Races', value: '${stats.gpRaces}'), StatItem(label: 'Grand Prix Points', value: '${stats.gpPoints}')],
                          [StatItem(label: 'Grand Prix Wins', value: '${stats.gpWins}'), StatItem(label: 'Grand Prix Podiums', value: '${stats.gpPodiums}')],
                          [StatItem(label: 'Grand Prix Poles', value: '${stats.gpPoles}'), StatItem(label: 'Grand Prix Top 10s', value: '${stats.gpTop10s}')],
                          [StatItem(label: 'DHL Fastest Laps', value: '${stats.fastestLaps}'), StatItem(label: 'DNFs', value: '${stats.dnfsSeason}')],
                          [StatItem(label: 'Sprint Races', value: '${stats.sprintRaces}'), StatItem(label: 'Sprint Points', value: '${stats.sprintPoints}')],
                          [StatItem(label: 'Sprint Wins', value: '${stats.sprintWins}'), StatItem(label: 'Sprint Podiums', value: '${stats.sprintPodiums}')],
                          [StatItem(label: 'Sprint Poles', value: '${stats.sprintPoles}'), StatItem(label: 'Sprint Top 10s', value: '${stats.sprintTop10s}')],
                        ]),
                      );
                      final summaryCard = StatsPanel(
                        title: 'TEAM SUMMARY',
                        buttonLabel: 'Results Archive',
                        child: StatLineList(rows: [
                          MapEntry('Season Position', _seasonPositionLabel),
                          MapEntry('Grands Prix Entered', '${summary.grandsPrixEntered}'),
                          MapEntry('Team Points', '${summary.teamPoints}'),
                          MapEntry('Highest Race Finish', summary.highestRaceFinish),
                          MapEntry('Podiums', '${summary.podiums}'),
                          MapEntry('Highest Grid Position', summary.highestGridPosition),
                          MapEntry('Pole Positions', '${summary.polePositions}'),
                          MapEntry('World Championships', '${summary.worldChampionships}'),
                        ]),
                      );

                      final isWide = constraints.maxWidth > 700;
                      if (isWide) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: seasonCard),
                            const SizedBox(width: 16),
                            Expanded(child: summaryCard),
                          ],
                        );
                      }
                      return Column(children: [seasonCard, const SizedBox(height: 16), summaryCard]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsStripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 16, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}