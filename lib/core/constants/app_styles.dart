import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

class AppStyles {
  static LinearGradient splashOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.primaryBlue.withValues(alpha: 0.7),
      AppColors.primaryPurple.withValues(alpha: 0.7),
    ],
  );

  static LinearGradient gradientBg = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primaryBlue, AppColors.primaryPurple],
  );

  static List<BoxShadow> customBoxShadow = [
    BoxShadow(
      color: AppColors.grey4.withValues(alpha: 0.6),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 3),
    ),
  ];
}
