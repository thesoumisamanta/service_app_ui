import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/core/data/service_data.dart';
import 'package:service_app_ui/core/routes/app_routes.dart';

class ServiceArea extends StatelessWidget {
  const ServiceArea({super.key});
  final services = serviceList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Service',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                 Navigator.pushNamed(context, AppRoutes.service);
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          GridView.count(
            padding: EdgeInsets.zero,
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.3,
            children: services.map((service) {
              return _buildServiceItem(service['title']!, service['image']!);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(String title, String iconPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            iconPath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black38,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(6.0),
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
