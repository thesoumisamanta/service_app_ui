import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/core/constants/app_styles.dart';
import 'package:service_app_ui/core/routes/app_routes.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_button.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_text_field.dart';
import 'package:service_app_ui/features/presentation/widgets/otp_input_widget.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Image.asset(
                    'assets/images/home_icon.png',
                    width: 45,
                    height: 45,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Verification',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Enter email address',
                      labelColor: AppColors.grey6,
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
                    const SizedBox(height: 24),
                    OtpInputWidget(
                      length: 4,
                      onCompleted: (otp) {},
                      borderColor: Colors.grey.shade300,
                      focusedBorderColor: Colors.blue,
                      borderWidth: 2.0,
                      borderRadius: 12.0,
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      text: 'Submit',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.auth);
                      },
                      gradient: AppStyles.gradientBg,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
