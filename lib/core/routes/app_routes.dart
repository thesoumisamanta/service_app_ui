import 'package:flutter/material.dart';
import 'package:service_app_ui/features/presentation/auth/login_screen.dart';
import 'package:service_app_ui/features/presentation/splash/splash_screen.dart';

class AppRoutes {
  // Route Names
  static const String splash = '/';
  static const String login = '/login';

  // Route Map
  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
  };
}
