import 'package:flutter/material.dart';
import 'package:islami/common/app_colors.dart';

class TimeTabPrayCard extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;

  const TimeTabPrayCard({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.black, AppColors.brown3],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text1,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(text2,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),),
              ),
              Text(text3,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),)
            ],
          ),
        ),
      ),
    );
  }
}
