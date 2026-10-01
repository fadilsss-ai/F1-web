import 'package:flutter/material.dart';

class F1TextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;

  const F1TextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white, fontFamily: 'GoogleSans'),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54, letterSpacing: 1.5),
        prefixIcon: Icon(icon, color: Colors.red),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.06),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class SpeedStripesPainter extends CustomPainter {
  final double progress;

  SpeedStripesPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = const Color(0xFF0A0A0A);
    canvas.drawRect(Offset.zero & size, bgPaint);

    final stripePaint = Paint()
      ..color = const Color(0xFFE10600).withValues(alpha: 0.18)
      ..style = PaintingStyle.fill;

    const double stripeWidth = 70;
    const double gap = 140;
    final double totalSpan = size.width + size.height + gap;
    final double shift = progress * gap;

    for (double x = -size.height - gap; x < totalSpan; x += gap) {
      final double offsetX = x + shift;
      final path = Path()
        ..moveTo(offsetX, size.height)
        ..lineTo(offsetX + size.height, 0)
        ..lineTo(offsetX + size.height + stripeWidth, 0)
        ..lineTo(offsetX + stripeWidth, size.height)
        ..close();
      canvas.drawPath(path, stripePaint);
    }
  }

  @override
  bool shouldRepaint(covariant SpeedStripesPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final CustomPainter painter;

  const SocialLoginButton({
    super.key,
    required this.onTap,
    required this.painter,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.06),
      shape: const CircleBorder(
        side: BorderSide(color: Colors.white24),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 54,
          height: 54,
          child: Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CustomPaint(painter: painter),
            ),
          ),
        ),
      ),
    );
  }
}

class XIconPainter extends CustomPainter {
  final Color color;
  XIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;
    const t = 0.22;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(w * t, 0)
      ..lineTo(w, h - h * t)
      ..lineTo(w, h)
      ..lineTo(w - w * t, h)
      ..lineTo(0, h * t)
      ..close()
      ..moveTo(w, 0)
      ..lineTo(w, h * t)
      ..lineTo(w * t, h)
      ..lineTo(0, h)
      ..lineTo(0, h - h * t)
      ..lineTo(w - w * t, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant XIconPainter oldDelegate) =>
      oldDelegate.color != color;
}

class AppleIconPainter extends CustomPainter {
  final Color color;
  AppleIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;

    final body = Path()
      ..moveTo(w * 0.52, h * 0.30)
      ..cubicTo(w * 0.18, h * 0.14, -w * 0.05, h * 0.52, w * 0.10, h * 0.80)
      ..cubicTo(w * 0.20, h * 0.98, w * 0.34, h * 1.02, w * 0.46, h * 0.94)
      ..cubicTo(w * 0.50, h * 0.91, w * 0.54, h * 0.91, w * 0.58, h * 0.94)
      ..cubicTo(w * 0.70, h * 1.02, w * 0.83, h * 0.96, w * 0.92, h * 0.76)
      ..cubicTo(w * 0.78, h * 0.68, w * 0.76, h * 0.46, w * 0.92, h * 0.36)
      ..cubicTo(w * 0.82, h * 0.20, w * 0.65, h * 0.18, w * 0.57, h * 0.25)
      ..cubicTo(w * 0.53, h * 0.28, w * 0.52, h * 0.29, w * 0.52, h * 0.30)
      ..close();

    final leaf = Path()
      ..moveTo(w * 0.52, h * 0.28)
      ..cubicTo(w * 0.54, h * 0.10, w * 0.68, h * 0.02, w * 0.80, h * 0.06)
      ..cubicTo(w * 0.77, h * 0.20, w * 0.62, h * 0.28, w * 0.52, h * 0.28)
      ..close();

    canvas.drawPath(body, paint);
    canvas.drawPath(leaf, paint);
  }

  @override
  bool shouldRepaint(covariant AppleIconPainter oldDelegate) =>
      oldDelegate.color != color;
}

class GoogleIconPainter extends CustomPainter {
  final Color color;
  GoogleIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width * 0.17;
    final ringPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    const startAngle = -0.55;
    const sweepAngle = 6.28318530718 - 1.15;
    canvas.drawArc(rect, startAngle, sweepAngle, false, ringPaint);

    final barPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final barRect = Rect.fromLTWH(
      size.width * 0.50,
      size.height * 0.42,
      size.width * 0.42,
      size.height * 0.16,
    );
    canvas.drawRect(barRect, barPaint);
  }

  @override
  bool shouldRepaint(covariant GoogleIconPainter oldDelegate) =>
      oldDelegate.color != color;
}