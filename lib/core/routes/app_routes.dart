import 'package:flutter/material.dart';
import 'package:service_app_ui/features/presentation/screens/auth/auth_screen.dart';
import 'package:service_app_ui/features/presentation/screens/auth/verification_screen.dart';
import 'package:service_app_ui/features/presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  // Route Names
  static const String splash = '/';
  static const String auth = '/auth';
  static const String verification = '/verification';
  static const String home = '/home';

  // Route Map
  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    auth: (context) => const AuthScreen(),
    verification: (context) => const VerificationScreen(),
  };
}
