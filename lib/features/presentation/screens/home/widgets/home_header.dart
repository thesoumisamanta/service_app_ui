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
          SvgPicture.asset('assets/icons/cart.svg', width: 23, height: 23),
          const SizedBox(width: 10),
          SvgPicture.asset('assets/icons/bell.svg', width: 22, height: 22),
        ],
      ),
    );
  }
}
