import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Gradient? gradient;
  final bool isLoading;
  final double height;
  final double borderRadius;
  final double? width;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.gradient,
    this.isLoading = false,
    this.height = 50,
    this.borderRadius = 14,
    this.width,
    this.prefixIcon,
    this.suffixIcon,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;
    final bool hasGradient = gradient != null;

    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: Container(
        decoration: BoxDecoration(
          gradient: hasGradient && !isDisabled ? gradient : null,
          borderRadius: BorderRadius.circular(borderRadius),
          border: hasGradient
              ? null
              : Border.all(color: AppColors.grey, width: 1.5),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isDisabled ? null : onPressed,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                        children: [
                        if (prefixIcon != null) ...[
                          prefixIcon!,
                          const SizedBox(width: 8),
                        ],
                        Text(
                          text,
                          style: TextStyle(
                          fontSize: fontSize ?? 16,
                          fontWeight: FontWeight.w600,
                          color: hasGradient
                            ? AppColors.white
                            : AppColors.darkText,
                          ),
                        ),
                        if (suffixIcon != null) ...[
                          const SizedBox(width: 8),
                          suffixIcon!,
                        ],
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
