import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/nexo_colors.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.7, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.7, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen())
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [Color(0xFF1A1A2E), Color(0xFF16213E)]
                    : [Color(0xFFE4EBFF), Color(0xFFCFDDFB)],
              ),
            ),
          ),

          // Background circles
          Positioned(
            top: -size.height * 0.2,
            right: -size.width * 0.1,
            child: Container(
              height: size.height * 0.4,
              width: size.height * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    NexoColors.primaryLight.withOpacity(0.3),
                    NexoColors.accentLight.withOpacity(0.2),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -size.height * 0.1,
            left: -size.width * 0.2,
            child: Container(
              height: size.height * 0.3,
              width: size.height * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    NexoColors.accentLight.withOpacity(0.2),
                    NexoColors.primaryLight.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo container with glass effect
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDark
                                ? Colors.white.withOpacity(0.1)
                                : Colors.white.withOpacity(0.8),
                            boxShadow: [
                              BoxShadow(
                                color: NexoColors.primaryLight.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.work_outline,
                              size: 60,
                              color: NexoColors.primaryLight,
                            ),
                          ),
                        ),

                        SizedBox(height: 32),

                        // App name
                        Text(
                          'Nexo',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            background: Paint()
                              ..shader = LinearGradient(
                                colors: NexoColors.primaryGradient,
                              ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          'Find your dream career',
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),

                        SizedBox(height: 48),

                        // Loading indicator
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            NexoColors.primaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}