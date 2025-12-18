import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/core/constants/app_styles.dart';
import 'package:service_app_ui/features/presentation/widgets/custom_button.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sealcoating Services',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Flexible(
                  child: Row(
                    children: [
                      Text(
                        'Rs. 699',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.primaryPurple,
                        ),
                      ),
                      SizedBox(width: 25),
                      Flexible(
                        child: Text(
                          'Rs. 299/year only',
                          style: TextStyle(
                            color: Color(0xFF3865E0),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                CustomButton(
                  text: 'Buy Now',
                  height: 30,
                  width: 120,
                  borderRadius: 10,
                  fontSize: 14,
                  suffixIcon: SvgPicture.asset(
                    'assets/icons/right_arrow.svg',
                    width: 12,
                    height: 12,
                  ),
                  onPressed: () {},
                  gradient: AppStyles.gradientBg,
                ),
                SizedBox(height: 8),
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
          ),
          SizedBox(width: 10),
          ClipRRect(
            child: Image.asset(
              'assets/images/sealcoating_sevices.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}