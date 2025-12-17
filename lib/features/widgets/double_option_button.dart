import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

class DoubleOptionButton extends StatelessWidget {
  final String leftText;
  final String rightText;

  const DoubleOptionButton({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                leftText,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),

          Container(width: 0.5, height: double.infinity, color: Colors.white),

          Expanded(
            child: Center(
              child: Text(
                rightText,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
