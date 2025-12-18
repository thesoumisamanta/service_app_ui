import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/core/constants/app_styles.dart';
import 'package:service_app_ui/core/routes/app_routes.dart';
import 'package:service_app_ui/features/presentation/widgets/bottom_bar.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_button.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_text_field.dart';
import 'package:service_app_ui/features/presentation/widgets/step_indicator.dart';

class CreateJobScreen extends StatelessWidget {
  const CreateJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryBlue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/back_arrow.svg',
                      width: 25,
                      height: 25,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
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
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                      child: SafeArea(
                        top: false,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              StepIndicator(currentStep: 1, totalSteps: 3),
                              const SizedBox(height: 24),
                              CustomTextField(
                                label: 'Job Title',
                                labelColor: AppColors.black,
                                height: 45,
                                fontWeight: FontWeight.w600,
                                borderColor: AppColors.lightBlue.withValues(alpha: 0.5),
                                labelIcon: SvgPicture.asset(
                                  'assets/icons/tag.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                type: TextFieldType.text,
                                isRequired: true,
                              ),
                              const SizedBox(height: 24),
                              CustomTextField(
                                height: 110,
                                label: 'Details',
                                fontWeight: FontWeight.w600,
                                type: TextFieldType.text,
                                labelColor: AppColors.black,
                                isRequired: true,
                                borderColor: AppColors.lightBlue.withValues(alpha: 0.5),
                                labelIcon: SvgPicture.asset(
                                  'assets/icons/file_upload.svg',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              const SizedBox(height: 24),
                              CustomTextField(
                                label: 'Category',
                                height: 45,
                                fontWeight: FontWeight.w600,
                                labelColor: AppColors.black,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/down_arrow.svg',
                                    width: 10,
                                    height: 10,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                borderColor: AppColors.lightBlue.withValues(alpha: 0.5),
                                labelIcon: SvgPicture.asset(
                                  'assets/icons/tag.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                type: TextFieldType.text,
                                isRequired: true,
                              ),
                              const SizedBox(height: 24),
                              CustomTextField(
                                label: 'Required Skills',
                                height: 45,
                                labelColor: AppColors.black,
                                fontWeight: FontWeight.w600,
                                borderColor: AppColors.lightBlue.withValues(alpha: 0.5),
                                labelIcon: SvgPicture.asset(
                                  'assets/icons/tag.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                type: TextFieldType.text,
                                isRequired: true,
                              ),
                              const SizedBox(height: 32),
                              CustomButton(
                                text: 'Next',
                                onPressed: () {
                                  Navigator.pushNamed(context, AppRoutes.service);
                                },
                                gradient: AppStyles.gradientBg,
                              ),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}