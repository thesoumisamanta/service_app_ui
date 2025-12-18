import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF124A9A);
  static const Color lightBlue = Color(0xFF1D61E7);
  static const Color primaryPurple = Color(0xFF3865E0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0XFFD3E5FF);
  static const Color darkGrey = Color(0xFF6C7278);
  static const Color grey = Color(0xFFEDF1F3);
  static const Color lightGrey = Color(0xFFF5F7F9);
  static const Color grey2 = Color(0xFFACB5BB);
  static const Color grey3 = Color(0xFFEFF0F6);
  static const Color grey4 = Color(0xFFA7A799);
  static const Color black = Color(0xFF000000);
  static const Color darkText = Color(0xFF3D0017);
  static const Color lightText = Color(0xFF9E6279);
  static const Color orange = Color(0xFFFF5B5B);

  static LinearGradient splashOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryBlue.withValues(alpha: 0.7),
      primaryPurple.withValues(alpha: 0.7),
    ],
  );
}
