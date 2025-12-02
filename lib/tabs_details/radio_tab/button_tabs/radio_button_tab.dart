import 'package:flutter/material.dart';

import '../widgets/radio_card_model.dart';

class RadioButtonTab extends StatelessWidget {
  const RadioButtonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return RadioCardModel.radioButtonTabCardsObjects[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: RadioCardModel.radioButtonTabCardsObjects.length,
            ),
          ),
        ],
      ),
    );
  }
}
