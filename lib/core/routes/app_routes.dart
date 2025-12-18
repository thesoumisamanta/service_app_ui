import 'package:flutter/material.dart';
import 'package:service_app_ui/features/presentation/screens/auth/auth_screen.dart';
import 'package:service_app_ui/features/presentation/screens/auth/verification_screen.dart';
import 'package:service_app_ui/features/presentation/screens/home/create_job_screen.dart';
import 'package:service_app_ui/features/presentation/screens/home/home_screen.dart';
import 'package:service_app_ui/features/presentation/screens/home/service_screen.dart';
import 'package:service_app_ui/features/presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  // Route Names
  static const String splash = '/';
  static const String auth = '/auth';
  static const String verification = '/verification';
  static const String home = '/home';
  static const String createJob = '/create-job';
  static const String service = '/service';

  // Route Map
  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    auth: (context) => const AuthScreen(),
    verification: (context) => const VerificationScreen(),
    home: (context) => const HomeScreen(),
    createJob: (context) => const CreateJobScreen(),
    service: (context) => const ServiceScreen(),
  };
}
