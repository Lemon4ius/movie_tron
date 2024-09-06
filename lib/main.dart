import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_tron/src/core/base_di/base_di.dart';
import 'package:movie_tron/src/core/navigation/app_route_path.dart';
import 'package:movie_tron/src/core_ui/colors/app_colors.dart';
import 'package:movie_tron/src/core_ui/styles/bar_theme/app_bar_theme.dart';
import 'package:movie_tron/src/core_ui/styles/text_theme/app_text_theme.dart';
import 'package:movie_tron/src/features/home_screen/presentation/home_page.dart';

import 'generated/l10n.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        splashColor: Colors.white30,
        fontFamily: 'Poppins',
        appBarTheme: appAppBarTheme(context),
        textTheme: appTextTheme(),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            onPrimary: Colors.white,
            background: AppColors.mainBackgroundColor
        ),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
      // home: const HomePage(),
    );
  }
}
