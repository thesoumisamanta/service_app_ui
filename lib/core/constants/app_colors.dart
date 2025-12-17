import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF124A9A);
  static const Color primaryPurple = Color(0xFF3865E0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkGrey = Color(0xFF6C7278);
  static const Color grey = Color(0xFFEDF1F3);

  static LinearGradient splashOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryBlue.withValues(alpha: 0.7),
      primaryPurple.withValues(alpha: 0.7),
    ],
  );
}
