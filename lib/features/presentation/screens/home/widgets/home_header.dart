import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_app_ui/core/constants/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundImage: AssetImage('assets/images/user.jpg'),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hello Tristan!',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Airpot Gate -Motital Colony-Rajbari-dubai',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset('assets/icons/coin.svg', width: 22, height: 22),
          const SizedBox(width: 10),
          _buildIconWithBadge(
            iconPath: 'assets/icons/cart.svg',
            width: 23,
            height: 23,
            badgeText: '1',
          ),
          const SizedBox(width: 10),
          _buildIconWithBadge(
            iconPath: 'assets/icons/bell.svg',
            width: 22,
            height: 22,
            showDot: true,
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithBadge({
    required String iconPath,
    required double width,
    required double height,
    String? badgeText,
    bool showDot = false,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          iconPath,
          width: width,
          height: height,
        ),
        Positioned(
          right: badgeText != null ? -8 : -2,
          top: badgeText != null ? 0 : -4,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: badgeText != null
                ? Center(
                    child: Text(
                      badgeText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 6,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}