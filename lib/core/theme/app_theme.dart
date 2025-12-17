import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // prevents instantiation

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // Global font
    fontFamily: 'SFProRounded',

    scaffoldBackgroundColor: Colors.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
