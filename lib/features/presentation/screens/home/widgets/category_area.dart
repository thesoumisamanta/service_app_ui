import 'package:flutter/material.dart';

class CategoryArea extends StatelessWidget {
  const CategoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _buildCategoryItem();
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
    );
  }

  Widget _buildCategoryItem() {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: 160,
      height: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/images/category-1.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Doe John',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // rating stars
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 14),
                  Icon(Icons.star, color: Colors.amber, size: 14),
                  Icon(
                    Icons.star_border_outlined,
                    color: Colors.black,
                    size: 14,
                  ),
                  // Icon(Icons.star_half, color: Colors.amber, size: 14),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const Icon(Icons.phone_android, color: Colors.black, size: 14),
              const SizedBox(width: 5),
              Text(
                '+1 234 567 890',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
