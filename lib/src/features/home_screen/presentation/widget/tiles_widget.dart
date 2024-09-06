import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_tron/src/core_ui/colors/app_colors.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core_ui/images/home_page/home_page_icon.dart';
import '../models/tiles_model.dart';

List<Widget> tilesWidget(BuildContext context) {
  var tilesIcons = [
    TilesModel(
      S.of(context).genre,
      HomePageIcon.genreIc,
    ),
    TilesModel(
      S.of(context).topImdb,
      HomePageIcon.starIc,
    ),
    TilesModel(
      S.of(context).language,
      HomePageIcon.languageIc,
    ),
    TilesModel(
      S.of(context).watched,
      HomePageIcon.watchedIc,
    ),
  ];
  return [
    Padding(
      padding: const EdgeInsets.only(left: 48, top: 36),
      child: Text(
        S.of(context).filters,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.titleMedium,
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
                              color: AppColors.white15))),
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromRGBO(81, 83, 94, 1)),
                    ),
                    onPressed: () {},
                    child: SvgPicture.asset(item.image),
                  ),
                ),
                SizedBox(
                  width: 62,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      textAlign: TextAlign.center,
                      maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        item.title,
                        style: Theme.of(context).textTheme.labelMedium),
                  ),
                ),
              ],
            )
        ],
      ),
    )
  ];
}
