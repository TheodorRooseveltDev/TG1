import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background splash image
          Image.asset(
            'assets/splash.png',
            fit: BoxFit.cover,
          ),
          
          // Custom white loader at the bottom
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Animated loader
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CustomPaint(
                      size: const Size(60, 60),
                      painter: _CustomLoaderPainter(
                        animation: _controller,
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 20),
                
                // Loading text
                const Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom loader painter for a beautiful animated effect
class _CustomLoaderPainter extends CustomPainter {
  final Animation<double> animation;

  _CustomLoaderPainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw rotating arcs
    for (int i = 0; i < 3; i++) {
      final startAngle = (animation.value * 2 * math.pi) + (i * 2 * math.pi / 3);
      final sweepAngle = math.pi * 0.5;
      
      paint.color = Colors.white.withOpacity(1.0 - (i * 0.3));
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - (i * 8)),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_CustomLoaderPainter oldDelegate) => true;
}
