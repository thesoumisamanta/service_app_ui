import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_button.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_text_field.dart';

class CreateJobScreen extends StatelessWidget {
  const CreateJobScreen({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/back_arrow.svg',
                        width: 25,
                        height: 25,
                        colorFilter: const ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Text(
                        'Post a Job',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/bell.svg',
                        width: 30,
                        height: 30,
                        colorFilter: const ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Complete all fields to get started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.16,
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
                      label: 'Job Title',
                      labelColor: AppColors.black,
                      borderColor: AppColors.lightBlue.withValues(alpha: 0.5),
                      labelIcon: SvgPicture.asset(
                        'assets/icons/tag.svg',
                        width: 16,
                        height: 16,
                      ),
                      type: TextFieldType.text,
                      isRequired: true,
                      // controller: _nameController,
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      height: 110,
                      label: 'Details',
                      type: TextFieldType.text,
                      labelColor: AppColors.black,
                      borderColor: AppColors.lightBlue.withValues(alpha: 0.5),
                      labelIcon: SvgPicture.asset(
                        'assets/icons/tag.svg',
                        width: 16,
                        height: 16,
                      ),
                      // controller: _nameController,
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      text: 'Next',
                      onPressed: () {},
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.primaryBlue,
                          AppColors.primaryPurple,
                        ],
                      ),
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
