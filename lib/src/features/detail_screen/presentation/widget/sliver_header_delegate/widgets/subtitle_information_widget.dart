import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';

import '../../../bloc/detail_bloc.dart';

Positioned subtitleInformation(double progress, DetailInitialState state, BuildContext context, double maxSize) {
  return Positioned(
    height: maxSize,
    // top: 0,
    child: AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: progress > 0.2 ? 0 : 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${state.detailFilm.releaseDate.substring(0, 4)} | ${state.detailFilm.genres.map(
                  (e) => e.name,
            ).join(', ')}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: RatingStars(
              value: state.detailFilm.voteAverage,
              valueLabelVisibility: false,
              starBuilder: (index, color) => SvgPicture.asset(
                'assets/image/detail_page/star.svg',
                color: color,
              ),
              starColor: const Color.fromRGBO(255, 200, 55, 1),
              starOffColor: const Color.fromRGBO(196, 196, 196, 1),
              starCount: 5,
              maxValue: 10,
              starSize: 23,
              starSpacing: 7,
            ),
          ),

        ],
      ),
    ),
  );
}