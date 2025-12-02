import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/tabs_details/quran_tab/widgets/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/sura details screen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> suraContent = [];
  late SuraModel suraModel;
  bool loadContent = true;

  bool error = false;
  bool success = false;
  bool loading = false;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (loadContent) {
      loadSuraContent();
      loadContent = false;
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.top]);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(suraModel.suraNameEnglish),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage(AppImages.suraDetailsHeader1),
                          height: height * 0.098,
                          width: width * 0.21,
                        ),
                        Text(
                          suraModel.suraNameArabic,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.gold,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        Image(
                          image: AssetImage(AppImages.suraDetailsHeader2),
                          height: height * 0.098,
                          width: width * 0.21,
                        )
                      ],
                    ),
                    success
                        ? Expanded(
                            child: SingleChildScrollView(
                              child: RichText(
                                textDirection: TextDirection.rtl,
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: AppColors.gold,
                                      ),
                                  children: List.generate(
                                    suraContent.length,
                                    (index) => TextSpan(
                                        text: '${suraContent[index]}(${index + 1}) '),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : loading
                            ? const Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : Expanded(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        errorText ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: AppColors.gold,
                                            ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => loadSuraContent(),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    AppColors.gold)),
                                        child: Text(
                                          'Try Again',
                                          style:
                                              TextStyle(color: AppColors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                  ],
                ),
              ),
            ),
            Image(
              image: AssetImage(AppImages.suraDetailsFooter),
              width: width,
            )
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraContent() async {
    loading = true;
    setState(() {});
    try {
      await Future.delayed(const Duration(seconds: 3));
      String fileContent = await rootBundle.loadString(
          'assets/files/suras/Suras/${suraModel.suraArrangement}.txt');
      suraContent = fileContent.trim().split('\n');
      loading = false;
      success = true;
      setState(() {});
    } catch (e) {
      loading = false;
      error = true;
      errorText = e.toString();
      setState(() {});
    }
  }
}
