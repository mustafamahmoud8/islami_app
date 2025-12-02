import 'package:flutter/material.dart';
import 'package:islami/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brown),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: AppColors.gold, fontSize: 20, fontWeight: FontWeight.w700),
        iconTheme: IconThemeData(color: AppColors.gold, size: 25)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.gold,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(color: AppColors.white),
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      selectedLabelStyle: TextStyle(
          color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w700),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brown),
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: AppColors.gold, fontSize: 20, fontWeight: FontWeight.w700),
        iconTheme: IconThemeData(color: AppColors.gold, size: 25)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.gold,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      //selectedIconTheme: IconThemeData(color: AppColors.white),
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      selectedLabelStyle: TextStyle(
          color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w700),
    ),
  );
}
