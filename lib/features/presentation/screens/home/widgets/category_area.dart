import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/core/data/service_data.dart';

class CategoryArea extends StatelessWidget {
  const CategoryArea({super.key});
  final categories =  categoryList;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildCategoryItem(
            name: category['name'],
            image: category['image'],
            rating: category['rating'],
            phone: category['phone'],
          );
        },
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
    );
  }

  Widget _buildCategoryItem({
    required String name,
    required String image,
    required double rating,
    required String phone,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: 130,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColors.grey2.withValues(alpha: 0.7)),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey4.withValues(alpha: 0.6),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              _buildRatingStars(rating),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const Icon(Icons.phone_android, color: AppColors.black, size: 14),
              const SizedBox(width: 2.0),
              Text(
                phone,
                style: const TextStyle(color: AppColors.black, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = 3 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      children: [
        ...List.generate(
          fullStars,
          (index) => const Icon(Icons.star, color: AppColors.orange, size: 14),
        ),
        if (hasHalfStar)
          const Icon(Icons.star_half, color: AppColors.orange, size: 14),
        ...List.generate(
          emptyStars,
          (index) => const Icon(
            Icons.star_border_outlined,
            color: Colors.black,
            size: 14,
          ),
        ),
      ],
    );
  }
}