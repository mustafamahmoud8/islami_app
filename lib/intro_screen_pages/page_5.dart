import 'package:flutter/material.dart';
import 'package:islami/intro_screen_pages/widgets/intro_screen_pages_header.dart';

import '../common/app_assets.dart';
import '../common/app_colors.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

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
            child: Image.asset(AppImages.page_5_image),
          ),
          Text(
            'Holy Quran Radio',
            style: TextStyle(
                color: AppColors.gold,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: height*0.042),
            child: Text(
              'You can listen to the Holy Quran Radio through the application for free and easily',
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,height: 1.5),textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
