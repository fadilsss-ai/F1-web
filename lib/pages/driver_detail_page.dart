import 'package:flutter/material.dart';
import '../models/driver.dart';
import '../data/driver_data.dart';
import '../widgets/stats_panel.dart';

class DriverDetailPage extends StatelessWidget {
  final Driver driver;

  const DriverDetailPage({super.key, required this.driver});

  String get _seasonPositionLabel {
    final ranked = [...kDrivers]..sort((a, b) => b.points.compareTo(a.points));
    final rank = ranked.indexWhere((d) => d.name == driver.name) + 1;
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
    final stats = driver.stats;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _DriverHero(driver: driver, positionLabel: _seasonPositionLabel),

            Padding(
              padding: const EdgeInsets.all(16),
              child: LayoutBuilder(
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
                  final careerCard = StatsPanel(
                    title: 'CAREER STATS',
                    buttonLabel: 'Results Archive',
                    child: StatLineList(rows: [
                      MapEntry('Season Position', _seasonPositionLabel),
                      MapEntry('Grands Prix Entered', '${stats.careerGpEntered}'),
                      MapEntry('Career Points', '${stats.careerPoints}'),
                      MapEntry('Highest Race Finish', stats.highestRaceFinish),
                      MapEntry('Podiums', '${stats.careerPodiums}'),
                      MapEntry('Highest Grid Position', stats.highestGridPosition),
                      MapEntry('Pole Positions', '${stats.polePositions}'),
                      MapEntry('World Championships', '${stats.worldChampionships}'),
                      MapEntry('DNFs', '${stats.careerDnfs}'),
                    ]),
                  );

                  final isWide = constraints.maxWidth > 700;
                  if (isWide) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: seasonCard),
                        const SizedBox(width: 16),
                        Expanded(child: careerCard),
                      ],
                    );
                  }
                  return Column(children: [seasonCard, const SizedBox(height: 16), careerCard]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DriverHero extends StatelessWidget {
  final Driver driver;
  final String positionLabel;

  const _DriverHero({required this.driver, required this.positionLabel});

  static Color _shade(Color c, double lightness, {double satFactor = 1.0}) {
    final hsl = HSLColor.fromColor(c);
    return hsl
        .withLightness(lightness)
        .withSaturation((hsl.saturation * satFactor).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final dark = _shade(driver.teamColor, 0.30, satFactor: 0.6);
    final mid = _shade(driver.teamColor, 0.45, satFactor: 0.85);
    final light = _shade(driver.teamColor, 0.62);
    final outline = _shade(driver.teamColor, 0.34, satFactor: 0.6);

    final parts = driver.name.trim().split(' ');
    final firstName = parts.first;
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    return LayoutBuilder(
      builder: (context, c) {
        final isWide = c.maxWidth > 700;
        final w = c.maxWidth;
        final h = isWide ? 460.0 : 580.0;
        const textStyleInfo = TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500);

        final infoRow = Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          runSpacing: 4,
          children: [
            Row(mainAxisSize: MainAxisSize.min, children: [
              Text(driver.countryFlag, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 6),
              Text(driver.nationalityCode, style: textStyleInfo),
            ]),
            Container(width: 1, height: 16, color: Colors.white38),
            Text(driver.team, style: textStyleInfo),
            Container(width: 1, height: 16, color: Colors.white38),
            Text(driver.number, style: textStyleInfo),
          ],
        );

        Widget pill(String text, {bool filled = false}) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: filled ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 16,
                  letterSpacing: 1,
                  color: filled ? Colors.black : Colors.white,
                ),
              ),
            );

        final textBlock = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              firstName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'GoogleSans',
                fontStyle: FontStyle.italic,
                fontSize: isWide ? 42 : 32,
                color: Colors.white,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                lastName.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: isWide ? 92 : 64,
                  letterSpacing: 1,
                  height: 0.95,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            infoRow,
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                pill('${driver.points} POIN'),
                pill(positionLabel, filled: true),
                if (driver.badge != null) pill(driver.badge!),
              ],
            ),
          ],
        );

        final bigNumber = FittedBox(
          fit: BoxFit.contain,
          child: Stack(
            children: [
              Text(
                driver.number,
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 400,
                  height: 1.0,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 14
                    ..strokeJoin = StrokeJoin.round
                    ..color = outline,
                ),
              ),
            ],
          ),
        );

        final photo = ClipRect(
          child: Image.asset(
            driver.imagePath,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            filterQuality: FilterQuality.high,
            errorBuilder: (context, error, stack) => const Center(
              child: Icon(Icons.person, size: 96, color: Colors.white24),
            ),
          ),
        );

        return SizedBox(
          width: double.infinity,
          height: h,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [dark, dark, mid, light],
                      stops: const [0.0, 0.35, 0.6, 1.0],
                    ),
                  ),
                ),
              ),
              if (isWide) ...[
                
                Positioned(
                  left: w * 0.78 - (w * 0.38) / 2,
                  width: w * 0.38,
                  top: h * 0.08,
                  height: h * 0.84,
                  child: bigNumber,
                ),
                Positioned(
                  left: w * 0.78 - (h * 0.70) / 2,
                  width: h * 0.70,
                  top: h * 0.09,
                  bottom: 0,
                  child: photo,
                ),
                Positioned.fill(
                  child: CustomPaint(
                    painter: _StripesPainter(x: w * 0.25, barHeight: 110),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: w * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Center(child: textBlock),
                  ),
                ),
              ] else ...[
                Positioned(
                  left: w * 0.05,
                  right: w * 0.05,
                  top: 230,
                  bottom: 30,
                  child: bigNumber,
                ),
  
                Positioned(
                  left: w / 2 - (h - 210) * 0.76 / 2,
                  width: (h - 210) * 0.76,
                  top: 210,
                  bottom: 0,
                  child: photo,
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 0,
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 44),
                      child: textBlock,
                    ),
                  ),
                ),
              ],
              Positioned(
                top: 0,
                left: 0,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StripesPainter extends CustomPainter {
  final double x;
  final double barHeight;

  _StripesPainter({required this.x, required this.barHeight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    void bar(double left, double width, double height, {required bool top}) {
      final path = Path();
      if (top) {
        path
          ..moveTo(left, 0)
          ..lineTo(left + width, 0)
          ..lineTo(left + width, height)
          ..lineTo(left, height - width)
          ..close();
      } else {
        final y = size.height;
        path
          ..moveTo(left, y)
          ..lineTo(left + width, y)
          ..lineTo(left + width, y - height + width)
          ..lineTo(left, y - height)
          ..close();
      }
      canvas.drawPath(path, paint);
    }

    bar(x - 14, 12, barHeight, top: true);
    bar(x + 2, 6, barHeight * 0.75, top: true);
    bar(x - 14, 12, barHeight, top: false);
    bar(x + 2, 6, barHeight * 0.75, top: false);
  }

  @override
  bool shouldRepaint(covariant _StripesPainter old) => old.x != x || old.barHeight != barHeight;
}