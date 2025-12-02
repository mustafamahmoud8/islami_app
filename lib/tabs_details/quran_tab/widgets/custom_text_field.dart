import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget image;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? suffix;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.image,
      this.controller,
      this.onChanged,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      cursorColor: AppColors.gold,
      style: TextStyle(
          color: AppColors.offWhite, fontSize: 16, fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.black.withOpacity(0.7),
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColors.offWhite.withOpacity(0.6),
            fontSize: 16,
            fontWeight: FontWeight.w700),
        suffix: suffix,
        prefixIcon: Padding(padding: const EdgeInsets.all(10), child: image),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.gold, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.gold, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.gold, width: 1),
        ),
      ),
    );
  }
}
