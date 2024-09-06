import 'package:flutter/material.dart';
import 'package:movie_tron/src/core_ui/colors/app_colors.dart';

TextTheme appTextTheme() {
  return const TextTheme(
    labelSmall: TextStyle(color: AppColors.grayLight, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(color: AppColors.grayLight,fontWeight: FontWeight.w500),
      labelMedium: TextStyle(color: AppColors.grayLight,fontWeight: FontWeight.w500),
  );
}