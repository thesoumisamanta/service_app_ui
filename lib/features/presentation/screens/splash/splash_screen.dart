import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/core/constants/app_styles.dart';
import 'package:service_app_ui/core/helpers/white_status_bar.dart';
import 'package:service_app_ui/core/routes/app_routes.dart';
import 'package:service_app_ui/features/presentation/widgets/double_option_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WhiteStatusBar(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/home_bg.jpg', fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: AppStyles.splashOverlayGradient,
              ),
            ),

            Center(
              child: Image.asset(
                'assets/images/home_icon.png',
                width: 100,
                height: 100,
              ),
            ),

            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 32,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Choose an option to get started. You can\nadd another account at any time.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 24),

                        DoubleOptionButton(
                          leftText: "I'm a Home Owner",
                          rightText: "I'm a Contractor",
                        ),

                        const SizedBox(height: 24),

                        RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: 'Log in',
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.auth,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),
                      ],
                    ),
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
