import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/tabs_details/quran_tab/sura_details_screen.dart';
import 'package:islami/tabs_details/quran_tab/widgets/sura_model.dart';

import '../../../common/app_assets.dart';
import '../../../common/app_colors.dart';

typedef OnClick = void Function(int);

class SuraTile extends StatelessWidget {
  final SuraModel suraModel;
  final OnClick onSuraClicked;

  const SuraTile(
      {super.key, required this.suraModel, required this.onSuraClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: ListTile(
        onTap: () {
          onSuraClicked(suraModel.suraArrangement!);
          Navigator.of(context)
              .pushNamed(SuraDetailsScreen.routeName, arguments: suraModel);
        },
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          height: 50,
          width: 50,
          child: Stack(
            children: [
              SvgPicture.asset(AppImages.suraVerse),
              Center(
                child: Text(
                  '${suraModel.suraArrangement}',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            suraModel.suraNameEnglish,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        subtitle: Text(
          '${suraModel.suraVerses} Verses',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
        trailing: Text(
          suraModel.suraNameArabic,
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
