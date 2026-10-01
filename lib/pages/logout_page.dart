import 'package:flutter/material.dart';
import 'login_page.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> with TickerProviderStateMixin {
  late final AnimationController _flagController;
  late final AnimationController _textController;
  late final Animation<double> _textFade;

  @override
  void initState() {
    super.initState();

    _flagController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    _textFade = CurvedAnimation(parent: _textController, curve: Curves.easeIn);

    Future.delayed(const Duration(milliseconds: 2400), () {
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    _flagController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _flagController,
              builder: (context, child) {
                return CustomPaint(
                  painter: _CheckeredFlagPainter(progress: _flagController.value),
                );
              },
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _textFade,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.flag_circle, color: Colors.red, size: 64),
                  SizedBox(height: 16),
                  Text(
                    'CHEQUERED FLAG',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'BebasNeue',
                      fontSize: 34,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Sampai jumpa di balapan berikutnya...',
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckeredFlagPainter extends CustomPainter {
  final double progress;

  _CheckeredFlagPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    const double tile = 36;
    final whitePaint = Paint()..color = Colors.white.withValues(alpha: 0.08);
    final double shift = progress * tile * 2;

    final rows = (size.height / tile).ceil() + 2;
    final cols = (size.width / tile).ceil() + 1;

    for (int row = -1; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        final isWhite = (row + col) % 2 == 0;
        if (!isWhite) continue;
        final rect = Rect.fromLTWH(
          col * tile,
          (row * tile) + shift,
          tile,
          tile,
        );
        canvas.drawRect(rect, whitePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CheckeredFlagPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}