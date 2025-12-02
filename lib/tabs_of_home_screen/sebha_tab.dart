import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/widgets/background_gradient_and_tab_details.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebhaCounter = 0;
  List<String> sebhaTexts = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر'
  ];
  int indexOfSebhaTexts = 0;

  double turns = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BackgroundGradientAndTabDetails(
      backgroundImage: AppImages.sebhaBackgroundImage,
      distanceBetweenIslamiLogoAndTabDetails: height * 0.162 + 20,
      gradiantIsVisible: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56),
              child: Image.asset(
                AppImages.sebhaTextImage,
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 142, right: 142),
                  child: Image.asset(AppImages.sebhaHeadShape),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 74, bottom: 92, right: 26, left: 26),
                  child: GestureDetector(
                    onTap: () {
                      sebhaLogic();
                    },
                    child: Stack(
                      children: [
                        AnimatedRotation(
                            turns: turns,
                            duration: const Duration(seconds: 1),
                            child: Image.asset(AppImages.sebhaBodyShape)),
                        Positioned(
                          right: 0,
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(sebhaTexts[indexOfSebhaTexts],
                                  style: GoogleFonts.justAnotherHand(
                                      color: AppColors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w700) //TextStyle(
                                  ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                sebhaCounter.toString(),
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  sebhaLogic() {
    sebhaCounter++;
    turns += 0.0335;
    if (sebhaCounter > 33) {
      if (indexOfSebhaTexts < sebhaTexts.length - 1) {
        indexOfSebhaTexts++;
      } else {
        indexOfSebhaTexts = 0;
      }
      sebhaCounter = 0;
    }
    setState(() {});
  }
}
