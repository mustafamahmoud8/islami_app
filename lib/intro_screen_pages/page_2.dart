import 'package:flutter/material.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/intro_screen_pages/widgets/intro_screen_pages_header.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: height*0.042),
            child: Image.asset(AppImages.page_2_image),
          ),
          Text(
            'Welcome To Islami',
            style: TextStyle(
                color: AppColors.gold,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height*0.042,horizontal: 10),
            child: Text(
              'We Are Very Excited To Have You In Our Community',
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
