import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/core/helpers/white_status_bar.dart';
import 'package:service_app_ui/features/presentation/screens/auth/widgets/login_widget.dart';
import 'package:service_app_ui/features/presentation/screens/auth/widgets/signup_widget.dart';
import 'package:service_app_ui/features/presentation/widgets/animated_toggle_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return WhiteStatusBar(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      'assets/images/home_icon.png',
                      width: 45,
                      height: 45,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Get Started now',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Create an account or log in to explore about our app',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AnimatedToggleButton(
                        values: ['Log In', 'Sign Up'],
                        height: 36,
                        width: MediaQuery.of(context).size.width,
                        initialIndex: _selectedIndex,
                        onToggle: (value) {
                          setState(() {
                            _selectedIndex = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      _selectedIndex == 0
                          ? const LoginWidget()
                          : const SignupWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}