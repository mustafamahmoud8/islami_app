import 'package:flutter/material.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/intro_screen_pages/widgets/intro_screen_pages_header.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: Image.asset(AppImages.page_1_image),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: height*0.085),
            child: Text(
              'Welcome To Islmi App',
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
