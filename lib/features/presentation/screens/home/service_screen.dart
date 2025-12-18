import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';
import 'package:service_app_ui/features/presentation/widgets/bottom_bar.dart';
import 'package:service_app_ui/features/presentation/widgets/service_card.dart';
import 'package:service_app_ui/features/presentation/widgets/service_widget.dart';
import 'package:service_app_ui/core/data/service_data.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  final jobServices = jobServicesData;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 24,
              ),
              child: ServiceWidget(),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ).copyWith(bottom: 100),
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
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
