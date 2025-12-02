import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/common/consts.dart';
import 'package:islami/tabs_details/quran_tab/sections/most_recently_section.dart';
import 'package:islami/tabs_details/quran_tab/sections/suras_list_section.dart';
import 'package:islami/tabs_details/quran_tab/widgets/custom_text_field.dart';
import 'package:islami/widgets/background_gradient_and_tab_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  TextEditingController controller = TextEditingController();
  List<int> mostRecentList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences prf = await SharedPreferences.getInstance();
    List<String>? data = prf.getStringList(AppConsts.mostRecentKey);
    mostRecentList = (data ?? [])
        .map(
          (e) => int.parse(e),
        )
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BackgroundGradientAndTabDetails(
      backgroundImage: AppImages.homeTabBackground,
      distanceBetweenIslamiLogoAndTabDetails: height * 0.162 + 20,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CustomTextField(
                onChanged: (p0) => setState(() {}),
                controller: controller,
                suffix: InkWell(
                  onTap: () {
                    controller.clear();
                    FocusScope.of(context).unfocus();
                    setState(() {});
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.grey,
                  ),
                ),
                hintText: 'Sura Name',
                image: SvgPicture.asset(
                  AppIcons.quranIcon,
                  colorFilter:
                      ColorFilter.mode(AppColors.gold, BlendMode.srcIn),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        MostRecentlySection(
                          suras: mostRecentList,
                          onSuraClicked: addToMostRecent,
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Suras List',
                        style: TextStyle(
                            color: AppColors.offWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SurasListSection(
                    search: controller.text.trim(),
                    onSuraClicked: addToMostRecent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToMostRecent(int id) {
    mostRecentList.insert(0, id);
    Set<int> temp = mostRecentList.toSet();
    mostRecentList = temp.toList();
    SharedPreferences.getInstance().then(
      (value) {
        value.setStringList(
            AppConsts.mostRecentKey,
            mostRecentList
                .map(
                  (e) => e.toString(),
                )
                .toList());
      },
    );
    setState(() {});
  }
}
