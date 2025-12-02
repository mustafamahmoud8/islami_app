import 'package:islami/tabs_details/radio_tab/widgets/radio_card.dart';

class RadioCardModel extends RadioCard {
  const RadioCardModel(
      {super.key, required super.radioCardText,
      super.mosqueImageIsVisible,
      super.soundWaveImageIsVisible});

  static List<RadioCardModel> radioButtonTabCardsObjects = [
    const RadioCardModel(
      radioCardText: 'Radio Ibrahim Al-Akdar',
      mosqueImageIsVisible: true,
    ),
    const RadioCardModel(
      radioCardText: 'Radio Al-Qaria Yassen',
      soundWaveImageIsVisible: true,
    ),
    const RadioCardModel(
      radioCardText: 'Radio Ahmed Al-trabulsi',
      mosqueImageIsVisible: true,
    ),
    const RadioCardModel(
      radioCardText: 'Radio Addokali Mohammad Alalim',
      mosqueImageIsVisible: true,
    )
  ];

  static List<RadioCardModel> recitersButtonTabCardsObjects = [
    const RadioCardModel(
      radioCardText: 'Ibrahim Al-Akdar',
      mosqueImageIsVisible: true,
    ),
    const RadioCardModel(
      radioCardText: 'Akram Alalaqmi',
      soundWaveImageIsVisible: true,
    ),
    const RadioCardModel(
      radioCardText: 'Majed Al-Enezi',
      mosqueImageIsVisible: true,
    ),
    const RadioCardModel(
      radioCardText: 'Malik shaibat Alhamed',
      mosqueImageIsVisible: true,
    )
  ];
}
