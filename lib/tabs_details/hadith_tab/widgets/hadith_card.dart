import 'package:flutter/material.dart';
import 'package:islami/tabs_details/hadith_tab/widgets/hadith_model.dart';

import '../../../common/app_assets.dart';
import '../../../common/app_colors.dart';

class HadithCard extends StatelessWidget {
  final HadithModel hadithModel;

  const HadithCard({super.key, required this.hadithModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppColors.gold,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              AppImages.hadithCardBackground,
              height: height * 0.8,
              width: width * 0.6,
              alignment: const Alignment(0, 0),
            ),
            Positioned(
              top: 42,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    hadithModel.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 12, right: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage(AppImages.suraDetailsHeader1),
                              height: height * 0.098,
                              width: width * 0.21,
                              color: AppColors.black,
                            ),
                            Image(
                              image: AssetImage(AppImages.suraDetailsHeader2),
                              height: height * 0.098,
                              width: width * 0.21,
                              color: AppColors.black,
                            )
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                hadithModel.details,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  AppImages.hadithCardFooter,
                  width: double.infinity,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
