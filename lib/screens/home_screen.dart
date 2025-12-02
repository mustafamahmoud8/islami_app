import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/common/app_colors.dart';

import '../tabs_of_home_screen/hadith_tab.dart';
import '../tabs_of_home_screen/quran_tab.dart';
import '../tabs_of_home_screen/radio_tab.dart';
import '../tabs_of_home_screen/sebha_tab.dart';
import '../tabs_of_home_screen/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    const QuranTab(),
    const HadithTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimeTab()
  ];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.top]);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              tabs[selectedIndex],
              Align(
                  alignment: const Alignment(0, -1),
                  child: Image.asset(
                    AppImages.islamiLogo,
                    width: width * 0.697,
                  ))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.quranIcon),
                label: 'Quran',
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(Radius.circular(66))),
                  child: SvgPicture.asset(
                    AppIcons.quranIcon,
                    colorFilter:
                        ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.hadithIcon),
                label: 'Hadith',
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(Radius.circular(66))),
                  child: SvgPicture.asset(
                    AppIcons.hadithIcon,
                    colorFilter:
                        ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.sebhaIcon),
                label: 'Sebha',
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(Radius.circular(66))),
                  child: SvgPicture.asset(
                    AppIcons.sebhaIcon,
                    colorFilter:
                        ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.radioIcon),
                label: 'Radio',
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(Radius.circular(66))),
                  child: SvgPicture.asset(
                    AppIcons.radioIcon,
                    colorFilter:
                        ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppIcons.timeIcon),
                label: 'Time',
                activeIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(Radius.circular(66))),
                  child: SvgPicture.asset(
                    AppIcons.timeIcon,
                    colorFilter:
                        ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
