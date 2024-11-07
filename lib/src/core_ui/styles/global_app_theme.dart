import 'package:flutter/material.dart';
import 'package:movie_tron/src/core_ui/styles/text_theme/app_text_theme.dart';

import '../colors/app_colors.dart';
import '../constans/font_famaly/font_famaly_constants.dart';

class GlobalAppTheme {
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);
  static final darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color colorFocus) {
    return ThemeData(
      colorScheme: colorScheme,
      focusColor: colorFocus,
      fontFamily: FontFamilyConstants.POPPINS,
      textTheme: appTextTheme(),
    );
  }

  static const darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    secondary: Color(0xFF4D1F7C),
    surface: AppColors.mainBackgroundColor,
    surfaceContainerHighest: AppColors.mainBackgroundColor,
    error: Colors.redAccent,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}
