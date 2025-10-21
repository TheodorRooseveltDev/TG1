import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../theme/app_theme.dart';

/// Animated casino-style blob background with dark purple theme
class CasinoBlobBackground extends StatefulWidget {
  final Widget child;
  final bool animated;

  const CasinoBlobBackground({
    super.key,
    required this.child,
    this.animated = true,
  });

  @override
  State<CasinoBlobBackground> createState() => _CasinoBlobBackgroundState();
}

class _CasinoBlobBackgroundState extends State<CasinoBlobBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();
    
    if (widget.animated) {
      _controller1 = AnimationController(
        duration: const Duration(seconds: 20),
        vsync: this,
      )..repeat();

      _controller2 = AnimationController(
        duration: const Duration(seconds: 15),
        vsync: this,
      )..repeat();

      _controller3 = AnimationController(
        duration: const Duration(seconds: 25),
        vsync: this,
      )..repeat();
    }
  }

  @override
  void dispose() {
    if (widget.animated) {
      _controller1.dispose();
      _controller2.dispose();
      _controller3.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base dark purple gradient background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.primaryDark,
                AppTheme.primaryMedium,
                AppTheme.primaryDark,
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
        ),

        // Animated blobs
        if (widget.animated) ...[
          // Blob 1 - Large purple blob (top right)
          AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Positioned(
                top: -100 + (math.sin(_controller1.value * 2 * math.pi) * 50),
                right: -150 + (math.cos(_controller1.value * 2 * math.pi) * 30),
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.blobPurple2.withOpacity(0.3),
                        AppTheme.blobPurple1.withOpacity(0.1),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              );
            },
          ),

          // Blob 2 - Medium purple blob (bottom left)
          AnimatedBuilder(
            animation: _controller2,
            builder: (context, child) {
              return Positioned(
                bottom: -80 + (math.cos(_controller2.value * 2 * math.pi) * 40),
                left: -100 + (math.sin(_controller2.value * 2 * math.pi) * 30),
                child: Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.blobPurple3.withOpacity(0.25),
                        AppTheme.blobPurple2.withOpacity(0.1),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              );
            },
          ),

          // Blob 3 - Small vibrant purple blob (center right)
          AnimatedBuilder(
            animation: _controller3,
            builder: (context, child) {
              return Positioned(
                top: 200 + (math.sin(_controller3.value * 2 * math.pi) * 60),
                right: -50 + (math.cos(_controller3.value * 2 * math.pi) * 40),
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.blobPurple4.withOpacity(0.2),
                        AppTheme.neonPurple.withOpacity(0.1),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              );
            },
          ),

          // Blob 4 - Gold accent blob (center left)
          AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Positioned(
                top: 300 + (math.cos(_controller1.value * 2 * math.pi) * 30),
                left: -80 + (math.sin(_controller1.value * 2 * math.pi) * 20),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.accentGold.withOpacity(0.08),
                        AppTheme.accentGoldDark.withOpacity(0.03),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              );
            },
          ),
        ] else ...[
          // Static blobs for non-animated screens
          Positioned(
            top: -100,
            right: -150,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.blobPurple2.withOpacity(0.3),
                    AppTheme.blobPurple1.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.blobPurple3.withOpacity(0.25),
                    AppTheme.blobPurple2.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],

        // Content overlay
        widget.child,
      ],
    );
  }
}
