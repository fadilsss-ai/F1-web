import 'package:flutter/material.dart';

class TrackOutline extends StatelessWidget {
  final List<Offset> points;
  final Color color;
  final double strokeWidth;

  const TrackOutline({
    super.key,
    required this.points,
    this.color = Colors.white,
    this.strokeWidth = 2.5,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TrackOutlinePainter(points: points, color: color, strokeWidth: strokeWidth),
    );
  }
}

class _TrackOutlinePainter extends CustomPainter {
  final List<Offset> points;
  final Color color;
  final double strokeWidth;

  _TrackOutlinePainter({required this.points, required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    final first = points.first;
    path.moveTo(first.dx * size.width, first.dy * size.height);
    for (final point in points.skip(1)) {
      path.lineTo(point.dx * size.width, point.dy * size.height);
    }
    canvas.drawPath(path, paint);

    // Titik start/finish kecil, sekadar aksen dekoratif.
    canvas.drawCircle(
      Offset(first.dx * size.width, first.dy * size.height),
      strokeWidth * 1.1,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant _TrackOutlinePainter oldDelegate) =>
      oldDelegate.points != points || oldDelegate.color != color;
}