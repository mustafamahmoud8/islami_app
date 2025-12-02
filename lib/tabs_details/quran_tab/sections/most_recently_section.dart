import 'package:flutter/material.dart';
import 'package:islami/tabs_details/quran_tab/widgets/sura_card.dart';
import 'package:islami/tabs_details/quran_tab/widgets/sura_model.dart';

import '../../../common/app_colors.dart';
import '../widgets/sura_tile.dart';

class MostRecentlySection extends StatelessWidget {
  final List<int> suras;
  final OnClick onSuraClicked;

  const MostRecentlySection(
      {super.key, required this.suras, required this.onSuraClicked});

  @override
  Widget build(BuildContext context) {
    List<SuraModel> temp = suras
        .map(
          (e) => SuraModel.suras[e -1],
        )
        .toList();
    double height = MediaQuery.of(context).size.height;
    return suras.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Most Recently',
                  style: TextStyle(
                      color: AppColors.offWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: height * 0.17,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: temp.length,
                  itemBuilder: (context, index) => SuraCard(
                      key: UniqueKey(),
                      onSuraClicked: onSuraClicked,
                      suraModel: temp[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 10,
                  ),
                ),
              )
            ],
          );
  }
}
