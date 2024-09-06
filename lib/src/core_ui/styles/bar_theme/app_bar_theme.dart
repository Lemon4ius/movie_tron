import 'package:flutter/material.dart';
import 'package:movie_tron/src/core_ui/colors/app_colors.dart';

AppBarTheme appAppBarTheme(BuildContext context) {
  return AppBarTheme(
      backgroundColor: AppColors.mainBackgroundColor,
      titleTextStyle: Theme.of(context).textTheme.headlineSmall
  );
}
