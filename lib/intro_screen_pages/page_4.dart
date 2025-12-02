import 'package:flutter/material.dart';
import 'package:islami/intro_screen_pages/widgets/intro_screen_pages_header.dart';

import '../common/app_assets.dart';
import '../common/app_colors.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const IntroScreenPagesHeader(),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16, vertical: height * 0.042),
            child: Image.asset(AppImages.page_4_image),
          ),
          Text(
            'Bearish',
            style: TextStyle(
                color: AppColors.gold,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16, vertical: height * 0.042),
            child: Text(
              'Praise the name of your Lord, the Most High',
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 2),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
