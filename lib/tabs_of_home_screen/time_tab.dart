import 'package:flutter/material.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/tabs_details/time_tab/parts/azkar_part.dart';
import 'package:islami/tabs_details/time_tab/parts/pray_times_part.dart';
import 'package:islami/widgets/background_gradient_and_tab_details.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BackgroundGradientAndTabDetails(
        backgroundImage: AppImages.timeTabBackground,
        gradiantIsVisible: true,
        distanceBetweenIslamiLogoAndTabDetails: height * 0.162,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [PrayTimesPart(), AzkarPart()],
            ),
          ),
        ));
  }
}
