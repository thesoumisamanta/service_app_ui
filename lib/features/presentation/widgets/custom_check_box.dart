import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String text;
  final Color? checkboxColor;
  final Color? textColor;
  final double? fontSize;
  final Color? borderColor;
  final FontWeight? fontWeight;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    this.checkboxColor,
    this.textColor,
    this.fontSize,
    this.borderColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 18,
            height: 18, 
            child: Center(
              child: Transform.scale(
                scale: 0.7,
                child: Checkbox(
                  value: value,
                  onChanged: (newValue) => onChanged(newValue ?? false),
                  activeColor: checkboxColor ?? AppColors.primaryBlue,
                  checkColor: AppColors.white,
                  side: BorderSide(
                    color: borderColor ?? AppColors.darkGrey,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: textColor ?? AppColors.grey6,
              fontSize: fontSize ?? 12,
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
