import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.black,
      statusBarColor: AppColors.gold,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
    introScreenOrHomeScreen();
  }

  void introScreenOrHomeScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final bool onboardingSeen = prefs.getBool('onboardingSeen') ?? false;

    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(
            onboardingSeen ? HomeScreen.routeName : IntroScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(AppImages.splashScreen2Background),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Align(
              alignment: const Alignment(0, -1),
              child: Image(
                image: AssetImage(AppImages.splashScreen2MosqueShape),
                width: width * 0.67,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, -1),
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Image(
                image: AssetImage(AppImages.splashScreen2Glow),
                width: width * 0.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 174),
            child: Image(
              image: AssetImage(AppImages.splashScreen2Shape1),
              width: width * 0.2,
            ),
          ),
          Center(
            child: Image(
              image: AssetImage(AppImages.splashScreen2Logo),
              width: width * 0.4,
            ),
          ),
          Align(
            alignment: const Alignment(1, 1),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Image(
                image: AssetImage(AppImages.splashScreen2Shape2),
                width: width * 0.23,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Image(
                image: AssetImage(AppImages.splashScreen2Branding1),
                width: width * 0.41,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: Image(
                image: AssetImage(AppImages.splashScreen2Branding2),
                width: width * 0.56,
              ),
            ),
          )
        ],
      ),
    );
  }
}
