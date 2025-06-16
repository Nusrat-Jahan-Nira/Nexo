import 'package:flutter/material.dart';

class NexoColors {
  // Main colors
  static const Color primaryLight = Color(0xFF6C63FF);
  static const Color accentLight = Color(0xFF00C9A7);
  static const Color backgroundLight = Color(0xFFF8F9FD);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color errorLight = Color(0xFFFF5252);
  static const Color successLight = Color(0xFF4CAF50);
  static const Color warningLight = Color(0xFFFFC107);
  static const Color infoLight = Color(0xFF2196F3);

  // Dark theme colors
  static const Color primaryDark = Color(0xFF8B80FF);
  static const Color accentDark = Color(0xFF00E5C7);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color cardDark = Color(0xFF1E1E1E);
  static const Color errorDark = Color(0xFFFF7575);
  static const Color successDark = Color(0xFF66BB6A);
  static const Color warningDark = Color(0xFFFFD54F);
  static const Color infoDark = Color(0xFF64B5F6);

  // Text colors
  static const Color textDarkPrimary = Color(0xFF303030);
  static const Color textDarkSecondary = Color(0xFF606060);
  static const Color textLightPrimary = Color(0xFFF5F5F5);
  static const Color textLightSecondary = Color(0xFFBDBDBD);

  // Glass effect colors
  static const Color glassLight = Color(0xFFFFFFFF);
  static const Color glassDark = Color(0xFF2A2A2A);

  // Gradients
  static const List<Color> primaryGradient = [primaryLight, accentLight];
  static const List<Color> secondaryGradient = [accentLight, Color(0xFF00E0FF)];
  static const List<Color> darkGradient = [Color(0xFF303030), Color(0xFF121212)];
}