import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/features/presentation/widgets/service_card.dart';
import 'package:service_app_ui/features/presentation/widgets/service_widget.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  final List<Map<String, dynamic>> servicesData = const [
    {
      'title': 'General Contracting',
      'price': 2000,
      'imagePath': 'assets/images/general_contracting.jpg',
    },
    {
      'title': 'Kitchen Remodel',
      'price': 2000,
      'imagePath': 'assets/images/kitchen_remodel.jpg',
    },
    {
      'title': 'Bathroom Remodel',
      'price': 2000,
      'imagePath': 'assets/images/bathroom_remodel.jpg',
    },
    {
      'title': 'Home_additions',
      'price': 2000,
      'imagePath': 'assets/images/home_additions.jpg',
    },
    {
      'title': 'Interior Design',
      'price': 2000,
      'imagePath': 'assets/images/interior_design.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            ServiceWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: servicesData.length,
                itemBuilder: (context, index) {
                  final service = servicesData[index];
                  return ServiceCard(
                    title: service['title'] as String,
                    price: service['price'] as int,
                    imagePath: service['imagePath'] as String,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
