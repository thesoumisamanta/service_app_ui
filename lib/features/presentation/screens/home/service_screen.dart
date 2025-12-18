import 'package:flutter/material.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/features/presentation/widgets/service_card.dart';
import 'package:service_app_ui/features/presentation/widgets/service_widget.dart';
import 'package:service_app_ui/core/data/service_data.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  final jobServices = jobServicesData;

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
                itemCount: jobServices.length,
                itemBuilder: (context, index) {
                  final service = jobServices[index];
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
