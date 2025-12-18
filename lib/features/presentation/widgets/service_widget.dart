import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey4.withValues(alpha: 0.6),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            'assets/icons/back_arrow.svg',
            width: 22,
            height: 22,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryBlue,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8),
          Text(
            'Looking for Services',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.grey4,
            ),
          ),
        ],
      ),
    );
  }
}
