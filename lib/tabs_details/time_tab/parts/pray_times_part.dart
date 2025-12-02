import 'package:flutter/material.dart';

import '../../../common/app_assets.dart';
import '../../../common/app_colors.dart';
import '../widgets/time_tab_pray_card.dart';

class PrayTimesPart extends StatefulWidget {
  const PrayTimesPart({super.key});

  @override
  State<PrayTimesPart> createState() => _PrayTimesPartState();
}

class _PrayTimesPartState extends State<PrayTimesPart> {
  int currentIndex = 0;

  List<TimeTabPrayCard> timeTabPrayCard = [
    const TimeTabPrayCard(text1: 'Fajr', text2: '04:00', text3: 'AM'),
    const TimeTabPrayCard(text1: 'Sunrise', text2: '06:04', text3: 'AM'),
    const TimeTabPrayCard(text1: 'Dhuhr', text2: '01:01', text3: 'PM'),
    const TimeTabPrayCard(text1: 'ASR', text2: '04:38', text3: 'PM'),
    const TimeTabPrayCard(text1: 'Maghrib', text2: '07:57', text3: 'PM'),
    const TimeTabPrayCard(text1: 'Isha', text2: '09:57', text3: 'PM'),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: height * 0.32,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.brown2,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              AppImages.timeTabShape1,
              height: height * 0.09,
            ),
            Column(
              children: [
                SizedBox(
                  height: height * 0.08,
                ),
                Container(
                  height: height * 0.28,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(40)),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: height * 0.028,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 59),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppImages.timeTabShape2,
                        color: AppColors.gold,
                        height: height * 0.054,
                      ),
                      Image.asset(
                        AppImages.timeTabShape3,
                        color: AppColors.gold,
                        height: height * 0.054,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '16 Jul,\n2024',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pray Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.black.withOpacity(0.7),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Tuesday',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.black.withOpacity(0.9),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '09 Muh,\n1446',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 90,
          left: 0,
          right: 0,
          child: SizedBox(
            height: height * 0.17,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.3),
              onPageChanged: (index) {
                currentIndex = index;
                setState(() {});
              },
              itemCount: timeTabPrayCard.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(
                    vertical: currentIndex == index ? 0 : 10),
                child: timeTabPrayCard[index],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Next Pray - 02:32',
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 24,
            right: 28,
            child: Image.asset(
              AppImages.timeTabSoundIcon,
              width: 24,
              height: 18,
            ))
      ],
    );
  }
}
