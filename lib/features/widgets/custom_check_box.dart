import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String text;
  final Color? checkboxColor;
  final Color? textColor;
  final double? fontSize;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    this.checkboxColor,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: (newValue) => onChanged(newValue ?? false),
              activeColor: checkboxColor ?? AppColors.primaryBlue,
              checkColor: AppColors.white,
              side: const BorderSide(
                color: AppColors.darkGrey, 
                width: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.black87,
              fontSize: fontSize ?? 14,
            ),
          ),
        ],
      ),
    );
  }
}
