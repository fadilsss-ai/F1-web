import 'package:flutter/material.dart';
import '../models/driver.dart';
import '../data/driver_data.dart';
import 'driver_detail_page.dart';

class StatisticsTabView extends StatelessWidget {
  const StatisticsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final ranked = [...kDrivers]..sort((a, b) => b.points.compareTo(a.points));

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: _TableHeaderRow(),
          ),
          const Divider(height: 1, color: Colors.white24),
          Expanded(
            child: ListView.separated(
              itemCount: ranked.length,
              separatorBuilder: (context, index) => const Divider(height: 1, color: Colors.white12),
              itemBuilder: (context, index) {
                final driver = ranked[index];
                final rank = index + 1;
                return _DriverRankRow(
                  driver: driver,
                  rank: rank,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DriverDetailPage(driver: driver)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TableHeaderRow extends StatelessWidget {
  const _TableHeaderRow();

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      color: Color(0xFFE10600),
      fontSize: 11,
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
    );
    return const Row(
      children: [
        SizedBox(width: 40, child: Text('POS.', style: labelStyle)),
        Expanded(flex: 4, child: Text('DRIVER', style: labelStyle)),
        Expanded(flex: 2, child: Text('NATIONALITY', style: labelStyle)),
        Expanded(flex: 3, child: Text('TEAM', style: labelStyle)),
        SizedBox(width: 44, child: Text('PTS.', style: labelStyle, textAlign: TextAlign.right)),
      ],
    );
  }
}

class _DriverRankRow extends StatelessWidget {
  final Driver driver;
  final int rank;
  final VoidCallback onTap;

  const _DriverRankRow({
    required this.driver,
    required this.rank,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Text(
                '$rank',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      width: 26,
                      height: 26,
                      color: driver.teamColor.withValues(alpha: 0.25),
                      child: Image.asset(
                        driver.imagePath,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      driver.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: driver.teamColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text(driver.countryFlag, style: const TextStyle(fontSize: 13)),
                  const SizedBox(width: 6),
                  Text(
                    driver.nationalityCode,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(color: driver.teamColor, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      driver.team,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: driver.teamColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 44,
              child: Text(
                '${driver.points}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}