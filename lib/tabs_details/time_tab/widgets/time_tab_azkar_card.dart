import 'package:flutter/material.dart';
import 'package:islami/common/app_colors.dart';

class TimeTabAzkarCard extends StatelessWidget {
  final String cardText;
  final String cardImage;

  const TimeTabAzkarCard(
      {super.key, required this.cardText, required this.cardImage});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: const Alignment(0, 0),
      children: [
        Container(
          height: height * 0.28,
          width: width * 0.43,
          decoration: BoxDecoration(
              color: AppColors.black,
              border: Border.all(color: AppColors.gold, width: 2),
              borderRadius: BorderRadius.circular(20)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 10),
              child: Image.asset(
                cardImage,
                height: height * 0.19,
                width: width * 0.43,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(
                cardText,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        )
      ],
    );
  }
}
