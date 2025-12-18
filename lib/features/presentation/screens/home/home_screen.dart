import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/features/presentation/screens/home/widgets/category_area.dart';
import 'package:service_app_ui/features/presentation/screens/home/widgets/home_header.dart';
import 'package:service_app_ui/features/presentation/screens/home/widgets/service_area.dart';
import 'package:service_app_ui/features/presentation/widgets/bottom_bar.dart';
import 'package:service_app_ui/features/presentation/widgets/carousel_slider.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_button.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryBlue, AppColors.primaryPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            HomeHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: CustomTextField(
                hint: 'Search for \'Asphalt Repair\'',
                height: 50,
                centerContent: true,
                bgColor: AppColors.white,
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider(
                      maxHeight: 150,
                      itemSpacing: 5,
                      viewportFraction: 0.92,
                      items: List.generate(3, (index) => _carouselItem()),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
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
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CategoryArea(),
                          const SizedBox(height: 60),
                        ],
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

  Widget _carouselItem() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sealcoating Services',
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Rs. 699',
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.primaryPurple,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Rs. 299/year only',
                    style: TextStyle(
                      color: Color(0xFF3865E0),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomButton(
                text: 'Buy Now',
                height: 30,
                width: 150,
                borderRadius: 10,
                fontSize: 14,
                suffixIcon: SvgPicture.asset(
                  'assets/icons/right_arrow.svg',
                  width: 12,
                  height: 12,
                ),
                onPressed: () {},
                gradient: const LinearGradient(
                  colors: [AppColors.primaryBlue, AppColors.primaryPurple],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '*Medicine Delivery: Up to 25% Off | Lab Tests: Up to 25% Off | Home Visit: ₹499 Only!',
                style: TextStyle(
                  color: Color(0xFF124A9A),
                  fontSize: 6,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
          Image.asset(
            'assets/images/sealcoating_sevices.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
