import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/features/widgets/custom_button.dart';
import 'package:service_app_ui/features/widgets/custom_check_box.dart';
import 'package:service_app_ui/features/widgets/custom_text_field.dart';
import 'package:service_app_ui/features/widgets/or_divider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            label: 'Email',
            hint: 'Enter your email',
            type: TextFieldType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Password',
            hint: 'Enter your password',
            type: TextFieldType.password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CustomCheckbox(
                value: isChecked,
                onChanged: (newValue) {
                  setState(() {
                    isChecked = newValue;
                  });
                },
                text: 'Remember Me',
              ),
              const Spacer(),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  color: AppColors.primaryBlue.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Log In',
            onPressed: () {},
            gradient: const LinearGradient(
              colors: [AppColors.primaryBlue, AppColors.primaryPurple],
            ),
          ),
          const SizedBox(height: 16),
          OrDivider(),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Continue with Google',
            onPressed: () {},
            prefixIcon: SvgPicture.asset(
              'assets/icons/google.svg',
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Continue with Facebook',
            onPressed: () {},
            prefixIcon: SvgPicture.asset(
              'assets/icons/facebook.svg',
              width: 20,
              height: 20,
            ),
          ),
        ],
    );
  }
}
