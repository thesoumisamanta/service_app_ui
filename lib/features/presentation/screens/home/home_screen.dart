import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/core/constants/app_styles.dart';
import 'package:service_app_ui/core/helpers/white_status_bar.dart';
import 'package:service_app_ui/features/presentation/screens/home/widgets/carousel_item.dart';
import 'package:service_app_ui/features/presentation/screens/home/widgets/category_area.dart';
import 'package:service_app_ui/features/presentation/screens/home/widgets/home_header.dart';
import 'package:service_app_ui/features/presentation/screens/home/widgets/service_area.dart';
import 'package:service_app_ui/features/presentation/widgets/bottom_bar.dart';
import 'package:service_app_ui/features/presentation/widgets/carousel_slider.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WhiteStatusBar(
      child: Scaffold(
        extendBody: true,
        body: Container(
          decoration: BoxDecoration(gradient: AppStyles.gradientBg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              HomeHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: Alignment.center,
                  child: IntrinsicWidth(
                    child: CustomTextField(
                      hint: 'Search for \'Asphalt Repair\'',
                      height: 50,
                      bgColor: AppColors.white,
                      borderColor: Colors.transparent,
                      focusedBorderColor: Colors.transparent,
                      hintFontSize: 18,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselSlider(
                        maxHeight: 160,
                        minHeight: 130,
                        itemSpacing: 5,
                        viewportFraction: 0.92,
                        items: List.generate(3, (index) => CarouselItem()),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: SafeArea(
                          top: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ServiceArea(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 0,
                                ).copyWith(top: 0),
                                child: Text(
                                  'Categories',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              CategoryArea(),
                            ],
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
      ),
    );
  }
}
