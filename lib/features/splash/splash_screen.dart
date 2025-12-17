import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          // Background Image
          Image.asset(
            'assets/images/home_bg.jpg',
            fit: BoxFit.cover,
          ),

          // Blue Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.splashOverlayGradient,
            ),
          ),

          // Center Icon
          Center(
            child: SvgPicture.asset(
              'assets/icons/home_icon.svg',
              width: 50,
              height: 50,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
