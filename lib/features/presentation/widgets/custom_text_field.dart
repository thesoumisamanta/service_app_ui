import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

enum TextFieldType { text, name, email, password, phone }

class CustomTextField extends StatelessWidget {
  final String? label;
  final Color? labelColor;
  final FontWeight? fontWeight;
  final String? hint;
  final TextFieldType type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final int maxLines;
  final bool obscureText;
  final Widget? labelIcon;
  final bool isRequired;
  final Color? borderColor;
  final double? height;
  final Color? bgColor;
  final bool centerContent;
  final Color? focusedBorderColor;
  final double? hintFontSize;

  const CustomTextField({
    super.key,
    this.label,
    this.labelColor,
    this.hint,
    this.type = TextFieldType.text,
    this.controller,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.labelIcon,
    this.isRequired = false,
    this.borderColor,
    this.height,
    this.fontWeight,
    this.bgColor,
    this.centerContent = false,
    this.focusedBorderColor,
    this.hintFontSize,
  });

  TextInputType get _keyboardType {
    switch (type) {
      case TextFieldType.email:
        return TextInputType.emailAddress;
      case TextFieldType.phone:
        return TextInputType.phone;
      case TextFieldType.name:
        return TextInputType.name;
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter> get _inputFormatters {
    switch (type) {
      case TextFieldType.phone:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ];
      case TextFieldType.name:
        return [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))];
      default:
        return [];
    }
  }

  TextCapitalization get _textCapitalization {
    return type == TextFieldType.name
        ? TextCapitalization.words
        : TextCapitalization.none;
  }

  @override
  Widget build(BuildContext context) {
    final isMultiline = !obscureText && (height != null && height! > 60 || maxLines > 1);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                if (labelIcon != null) ...[
                  labelIcon!,
                  const SizedBox(width: 6),
                ],
                Text(
                  label!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    color: labelColor,
                  ),
                ),
                if (isRequired)
                  const Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Text(
                      '*',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        SizedBox(
          height: height,
          child: TextFormField(
            controller: controller,
            obscuringCharacter: '*',
            style: TextStyle(letterSpacing: 1),
            keyboardType: isMultiline ? TextInputType.multiline : _keyboardType,
            obscureText: obscureText,
            enabled: enabled,
            maxLength: maxLength,
            maxLines: isMultiline ? null : 1,
            minLines: isMultiline ? null : 1,
            expands: isMultiline && height != null,
            textAlign: centerContent ? TextAlign.center : TextAlign.start,
            textAlignVertical: isMultiline ? TextAlignVertical.top : TextAlignVertical.center,
            textCapitalization: _textCapitalization,
            inputFormatters: _inputFormatters,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: AppColors.grey4, fontSize: hintFontSize ?? 14),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              filled: bgColor != null,
              fillColor: bgColor,
              contentPadding: isMultiline 
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 12)
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColor ?? AppColors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: focusedBorderColor ?? AppColors.primaryBlue),
              ),
            ),
          ),
        ),
      ],
    );
  }
}