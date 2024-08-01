import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core_ui/images/home_page/home_page_icon.dart';
import '../models/tiles_model.dart';

List<Widget> tilesWidget(BuildContext context) {
  var tilesIcons = [
    TilesModel(
      'Genre',
      HomePageIcon.genreIc,
    ),
    TilesModel(
      'Top IMDB',
      HomePageIcon.starIc,
    ),
    TilesModel(
      'Language',
      HomePageIcon.languageIc,
    ),
    TilesModel(
      'Watched',
      HomePageIcon.watchedIc,
    ),
  ];
  return [
    Padding(
      padding: const EdgeInsets.only(left: 48, top: 36),
      child: Text(
        'Filters',
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 16, left: 48, right: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final item in tilesIcons)
            Column(
              children: [
                SizedBox(
                  height: 52,
                  width: 52,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(Colors.white30),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 0.15)))),
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromRGBO(81, 83, 94, 1)),
                    ),
                    onPressed: () {},
                    child: SvgPicture.asset(item.image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(item.title,
                      style: Theme.of(context).textTheme.labelMedium),
                ),
              ],
            )
        ],
      ),
    )
  ];
}
