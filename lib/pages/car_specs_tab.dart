import 'package:flutter/material.dart';
import '../models/team.dart';
import '../data/driver_data.dart';
import '../data/team_data.dart';
import 'team_detail_page.dart';

class CarSpecsTabView extends StatelessWidget {
  const CarSpecsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'F1 TEAMS 2026',
            style: TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 28,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Tim Formula 1 musim 2026',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 700;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: kTeams.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isWide ? 2 : 1,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: isWide ? 1.9 : 1.5,
                ),
                itemBuilder: (context, index) {
                  final team = kTeams[index];
                  return _TeamCard(
                    team: team,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TeamDetailPage(team: team)),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}


class _TeamCard extends StatelessWidget {
  final Team team;
  final VoidCallback onTap;

  const _TeamCard({required this.team, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final drivers = kDrivers.where((d) => d.team == team.name).toList();

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: const Color(0xFF1A1A1A),
              child: Image.asset(
                team.imagePath,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                filterQuality: FilterQuality.high,
              ),
            ),

            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black54, Colors.transparent],
                  stops: [0.0, 0.6],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    team.name,
                    style: const TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 24,
                      letterSpacing: 0.5,
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black87, blurRadius: 8)],
                    ),
                  ),
                  const SizedBox(height: 8),
                  for (final driver in drivers)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
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
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              shadows: [Shadow(color: Colors.black87, blurRadius: 6)],
                            ),
                          ),
                        ],
                      ),
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