import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class BackgroundGradientAndTabDetails extends StatelessWidget {
  final String backgroundImage;
  final Widget child;
  final double distanceBetweenIslamiLogoAndTabDetails;
  final bool? gradiantIsVisible;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;

  const BackgroundGradientAndTabDetails(
      {super.key,
      required this.backgroundImage,
      required this.child,
      required this.distanceBetweenIslamiLogoAndTabDetails,
      this.gradiantIsVisible,
      this.fit, this.alignment});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Image.asset(
            backgroundImage,
            height: height,
            width: width,
            fit:fit?? BoxFit.cover,
            alignment: alignment??Alignment.center,
          ),
        ),
        Visibility(
          visible: gradiantIsVisible ?? true,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.black.withOpacity(0.7), AppColors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.5, 1]),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: distanceBetweenIslamiLogoAndTabDetails,
            ),
            Expanded(child: child)
          ],
        ),
      ],
    );
  }
}
