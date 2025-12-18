import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

enum TextFieldType { text, name, email, password, phone }

class CustomTextField extends StatelessWidget {
  final String? label;
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

  const CustomTextField({
    super.key,
    this.label,
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
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
        ];
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              label!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF666666),
              ),
            ),
          ),
        TextFormField(
          controller: controller,
          keyboardType: _keyboardType,
          obscureText: obscureText,
          enabled: enabled,
          maxLength: maxLength,
          maxLines: maxLines,
          textCapitalization: _textCapitalization,
          inputFormatters: _inputFormatters,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primaryBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

