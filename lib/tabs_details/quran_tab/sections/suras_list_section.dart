import 'package:flutter/material.dart';
import 'package:islami/tabs_details/quran_tab/widgets/sura_model.dart';
import 'package:islami/tabs_details/quran_tab/widgets/sura_tile.dart';

import '../../../common/app_colors.dart';

class SurasListSection extends StatelessWidget {
  final String? search;
  final OnClick onSuraClicked;

  const SurasListSection(
      {super.key, required this.search, required this.onSuraClicked});

  @override
  Widget build(BuildContext context) {
    List<SuraModel> filterSuras = SuraModel.suras
        .where(
          (element) =>
              element.suraNameArabic.contains(search ?? '') ||
              element.suraNameEnglish
                  .toLowerCase()
                  .contains((search ?? '').toLowerCase()),
        )
        .toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: filterSuras.length,
        (context, index) {
          return Column(
            children: [
              SuraTile(
                suraModel: filterSuras[index],
                onSuraClicked: onSuraClicked,
              ),
              index == filterSuras.length - 1
                  ? const SizedBox.shrink()
                  : Divider(
                      endIndent: 50,
                      indent: 40,
                      thickness: 1,
                      color: AppColors.white,
                    ),
            ],
          );
        },
      ),
    );
  }
}
