import 'package:flutter/material.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/tabs_details/time_tab/widgets/time_tab_azkar_card.dart';

class AzkarPart extends StatelessWidget {
  const AzkarPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Azkar',
            style: TextStyle(
                color: AppColors.gold2,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TimeTabAzkarCard(
                cardText: 'Evening Azkar',
                cardImage: AppImages.timeTabEveningAzkar,
              ),
              TimeTabAzkarCard(
                cardText: 'Morning Azkar',
                cardImage: AppImages.timeTabMorningAzkar,
              ),
            ],
          ),
        )
      ],
    );
  }
}
