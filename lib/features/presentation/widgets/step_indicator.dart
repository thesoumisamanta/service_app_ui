import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalSteps * 2 - 1, (index) {
        if (index.isEven) {
          int stepNumber = (index ~/ 2) + 1;
          bool isActive = stepNumber == currentStep;
          bool isCompleted = stepNumber < currentStep;

          return Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isActive || isCompleted
                  ? AppColors.primaryBlue
                  : AppColors.grey3,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$stepNumber',
                style: TextStyle(
                  color: isActive || isCompleted
                      ? AppColors.white
                      : AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        } else {
          int stepNumber = (index ~/ 2) + 1;
          bool isCompleted = stepNumber < currentStep;
          bool isInProgress = stepNumber == currentStep;

          return Container(
            width: 80,
            height: 4,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.grey3,
              borderRadius: BorderRadius.circular(2),
            ),
            child: isCompleted || isInProgress
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: isCompleted ? 80 : 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  )
                : null,
          );
        }
      }),
    );
  }
}
