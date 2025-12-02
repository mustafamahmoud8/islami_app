import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/tabs_details/radio_tab/button_tabs/radio_button_tab.dart';
import 'package:islami/tabs_details/radio_tab/button_tabs/reciters_button_tab.dart';
import 'package:islami/widgets/background_gradient_and_tab_details.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> with TickerProviderStateMixin {
  late TabController tabController = TabController(
      length: 2, vsync: this, animationDuration: const Duration(seconds: 2));

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BackgroundGradientAndTabDetails(
      backgroundImage: AppImages.radioBackgroundImage,
      distanceBetweenIslamiLogoAndTabDetails: height * 0.162 + 16,
      gradiantIsVisible: false,
      child: Align(
        alignment: const Alignment(0, -1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: const Alignment(0, 0),
              children: [
                Container(
                  height: height * 0.05,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                ButtonsTabBar(
                  tabs: const [
                    Tab(text: 'Radio'),
                    Tab(text: 'Reciters'),
                  ],
                  height: height * 0.055,
                  width: width * 0.92 / 2,
                  labelStyle: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  unselectedLabelStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  controller: tabController,
                  contentCenter: true,
                  radius: 12,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                  ),
                  unselectedDecoration:
                      const BoxDecoration(color: Colors.transparent),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [RadioButtonTab(), RecitersButtonTab()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
