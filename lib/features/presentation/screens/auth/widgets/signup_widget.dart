import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/core/routes/app_routes.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_button.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_check_box.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_text_field.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  bool isChecked = false;
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Name',
          hint: 'Enter your name',
          type: TextFieldType.name,
          // controller: _nameController,
        ),
        const SizedBox(height: 12),
        CustomTextField(
          label: 'Email',
          hint: 'Enter your email',
          type: TextFieldType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        CustomTextField(
          label: 'Phone',
          hint: 'Enter your phone number',
          type: TextFieldType.phone,
          // controller: _phoneController,
        ),
        const SizedBox(height: 12),
        CustomTextField(
          label: 'Password',
          hint: 'Enter your password',
          type: TextFieldType.password,
          obscureText: isPasswordHidden,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                isPasswordHidden
                    ? 'assets/icons/eye.svg'
                    : 'assets/icons/eye_off.svg',
                colorFilter: const ColorFilter.mode(
                  AppColors.grey2,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
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
        const SizedBox(height: 12),
        CustomTextField(
          label: 'Password',
          hint: 'Enter your password',
          type: TextFieldType.password,
          obscureText: isPasswordHidden,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                isPasswordHidden
                    ? 'assets/icons/eye.svg'
                    : 'assets/icons/eye_off.svg',
                colorFilter: const ColorFilter.mode(
                  AppColors.grey2,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
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
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomCheckbox(
            value: isChecked,
            borderColor: AppColors.primaryBlue,
            onChanged: (newValue) {
              setState(() {
                isChecked = newValue;
              });
            },
            text: 'Terms & Conditions',
            textColor: AppColors.primaryBlue,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        CustomButton(
          text: 'Sign Up',
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.verification);
          },
          gradient: const LinearGradient(
            colors: [AppColors.primaryBlue, AppColors.primaryPurple],
          ),
        ),
      ],
    );
  }
}
