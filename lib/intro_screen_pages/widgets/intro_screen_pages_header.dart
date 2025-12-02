import 'package:flutter/material.dart';

import '../../common/app_assets.dart';

class IntroScreenPagesHeader extends StatelessWidget {
  const IntroScreenPagesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Image.asset(
      AppImages.islamiLogo,
      width: width * 0.67,
    );
  }
}
