import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/tabs_details/hadith_tab/widgets/hadith_card.dart';
import 'package:islami/widgets/background_gradient_and_tab_details.dart';

import '../tabs_details/hadith_tab/widgets/hadith_model.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> hadiths = [];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadHadithContent();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BackgroundGradientAndTabDetails(
      backgroundImage: AppImages.hadithTabBackground,
      distanceBetweenIslamiLogoAndTabDetails: height * 0.162 + 44,
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
      child: PageView.builder(
        onPageChanged: (index) {
          currentIndex = index;
          setState(() {});
        },
        controller: PageController(viewportFraction: 0.8),
        itemCount: hadiths.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(vertical: index == currentIndex ? 0 : 20),
            child: HadithCard(
              hadithModel: hadiths[index],
            ),
          );
        },
      ),
    );
  }

  Future<void> loadHadithContent() async {
    for (int i = 0; i < 50; i++) {
      String fileContent = await rootBundle
          .loadString('assets/files/hadiths/Hadeeth/h${i + 1}.txt');
      String title = fileContent.trim().split('\n').first;
      String details = fileContent.substring(title.length);
      hadiths.add(
          HadithModel(hadithArrangment: i + 1, title: title, details: details));
    }
    setState(() {});
  }
}
