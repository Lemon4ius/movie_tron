import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget {
  final String title;

  const AppTopBar(this.title, {super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
