import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_tron/src/core_ui/styles/bar_theme/app_bar_theme.dart';
import 'package:movie_tron/src/core_ui/styles/text_theme/app_text_theme.dart';
import 'package:movie_tron/src/features/home_screen/presentation/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        appBarTheme: appAppBarTheme(),
        textTheme: appTextTheme(),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            onPrimary: Colors.white,
            background: const Color.fromRGBO(9, 9, 15, 1)),
        cardTheme: const CardTheme(color: Color.fromRGBO(66, 66, 66, 1)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
