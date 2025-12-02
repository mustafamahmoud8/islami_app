import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/intro_screen_pages/page_1.dart';
import 'package:islami/intro_screen_pages/page_2.dart';
import 'package:islami/intro_screen_pages/page_3.dart';
import 'package:islami/intro_screen_pages/page_4.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../intro_screen_pages/page_5.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = '/intro screen';

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  List<Widget> introScreenPages = [const Page1(), const Page2(), const Page3(), const Page4(), const Page5()];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.black,
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              currentIndex = value;
              setState(() {});
            },
            itemCount: introScreenPages.length,
            itemBuilder: (context, index) {
              return introScreenPages[index];
            },
          ),
          currentIndex == 0
              ? const SizedBox.shrink()
              : Positioned(
                  bottom: 16,
                  left: 16,
                  child: TextButton(
                    onPressed: () {
                      pageController.previousPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
          Positioned(
            bottom: 16,
            right: 16,
            child: TextButton(
              onPressed: () async {
                if (currentIndex == introScreenPages.length - 1) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('onboardingSeen', true);
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                } else {
                  pageController.nextPage(
                      duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                }
              },
              child: Text(
                currentIndex == introScreenPages.length - 1 ? 'Finish' : 'Next',
                style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            right: 0,
            left: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: introScreenPages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  dotColor: AppColors.grey,
                  activeDotColor: AppColors.gold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
