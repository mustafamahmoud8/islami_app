import 'package:flutter/material.dart';
import 'package:islami/common/app_assets.dart';
import 'package:islami/common/app_colors.dart';

class RadioCard extends StatefulWidget {
  final String radioCardText;
  final bool mosqueImageIsVisible;
  final bool soundWaveImageIsVisible;

  const RadioCard({
    super.key,
    required this.radioCardText,
    this.mosqueImageIsVisible = false,
    this.soundWaveImageIsVisible = false,
  });

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  IconData radioCardPlay = Icons.play_arrow_rounded;
  String radioCardSound = AppImages.radioCardSoundOn;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom:0,
          right: 0,
          left: 0,
          child: Stack(
            children: [
              Container(
                height: height * 0.14,
                alignment: const Alignment(0, 1),
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Visibility(
                    visible: widget.mosqueImageIsVisible,
                    child: Image.asset(
                      AppImages.radioMosque,
                      color: AppColors.black.withOpacity(0.2),
                      width: width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.soundWaveImageIsVisible,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.hardEdge,
                  child: Transform.translate(
                    offset: const Offset(0, 52),
                    child: Image.asset(
                      AppImages.radioSoundWave3,
                      color: AppColors.black.withOpacity(0.2),
                      width: width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: const Alignment(0, 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Text(
                  widget.radioCardText,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 14,
                ),
                IconButton(
                  onPressed: () {
                    if (radioCardPlay == Icons.play_arrow_rounded) {
                      radioCardPlay = Icons.pause_rounded;
                    } else if (radioCardPlay == Icons.pause_rounded) {
                      radioCardPlay = Icons.play_arrow_rounded;
                    }
                    setState(() {});
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    radioCardPlay,
                    size: 50,
                    color: AppColors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 100,
          bottom: 14,
          child: IconButton(
            onPressed: () {
              if (radioCardSound == AppImages.radioCardSoundOn) {
                radioCardSound = AppImages.radioCardSoundOff;
              } else if (radioCardSound == AppImages.radioCardSoundOff) {
                radioCardSound = AppImages.radioCardSoundOn;
              }
              setState(() {});
            },
            padding: EdgeInsets.zero,
            icon: Image.asset(
              radioCardSound,
              height: 26,
              width: 26,
            ),
          ),
        )
      ],
    );
  }
}
