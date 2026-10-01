import 'package:flutter/material.dart';
import '../models/driver.dart';

class DriverCard extends StatelessWidget {
  final Driver driver;
  final int rank;
  final VoidCallback onTap;

  const DriverCard({
    super.key,
    required this.driver,
    required this.rank,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.lerp(driver.teamColor, Colors.black, 0.82)!,
                Color.lerp(driver.teamColor, Colors.black, 0.45)!,
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(painter: _DotTexturePainter(color: driver.teamColor)),
              ),
              
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, box) {
                    const photoWidth = 170.0;
                    final left = (box.maxWidth * 0.58 - photoWidth / 2)
                        .clamp(0.0, box.maxWidth - photoWidth);
                    return Stack(
                      children: [
                        Positioned(
                          left: left,
                          top: 8,
                          bottom: 0,
                          width: photoWidth,
                          child: _DriverPhoto(driver: driver),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 190, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _DriverNameBlock(driver: driver),
                    const SizedBox(height: 6),
                    Text(
                      driver.team,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'GoogleSans',
                        color: Colors.white.withValues(alpha: 0.75),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      driver.number,
                      style: const TextStyle(
                        fontFamily: 'BebasNeue',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 14,
                bottom: 12,
                child: _RankBadge(rank: rank),
              ),
              Positioned(
                left: 62,
                bottom: 12,
                child: _FlagBadge(flag: driver.countryFlag),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DriverNameBlock extends StatelessWidget {
  final Driver driver;

  const _DriverNameBlock({required this.driver});

  @override
  Widget build(BuildContext context) {
    final parts = driver.name.split(' ');
    final firstName = parts.first;
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'GoogleSans',
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white70,
          ),
        ),
        Text(
          lastName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'GoogleSans',
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w800,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white70,
          ),
        ),
      ],
    );
  }
}

class _RankBadge extends StatelessWidget {
  final int rank;

  const _RankBadge({required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        '$rank',
        style: const TextStyle(
          fontFamily: 'BebasNeue',
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _FlagBadge extends StatelessWidget {
  final String flag;

  const _FlagBadge({required this.flag});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Text(flag, style: const TextStyle(fontSize: 14)),
    );
  }
}

class _DriverPhoto extends StatelessWidget {
  final Driver driver;

  const _DriverPhoto({required this.driver});

  @override
  Widget build(BuildContext context) {
    
    return ClipRect(
      child: Image.asset(
        driver.imagePath,
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
        filterQuality: FilterQuality.high,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.black.withValues(alpha: 0.25),
            alignment: Alignment.center,
            child: Icon(
              Icons.person,
              size: 56,
              color: Colors.white.withValues(alpha: 0.35),
            ),
          );
        },
      ),
    );
  }
}

class _DotTexturePainter extends CustomPainter {
  final Color color;

  _DotTexturePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withValues(alpha: 0.10);
    const double spacing = 10;
    const double radius = 1.1;

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotTexturePainter oldDelegate) =>
      oldDelegate.color != color;
}