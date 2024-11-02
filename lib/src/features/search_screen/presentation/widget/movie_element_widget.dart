import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/image_network_base_path.dart';
import '../bloc/search_bloc.dart';

Stack movieElement(
    SearchLoadedDefaultMovieState state, int index, BuildContext context) {
  return Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl:
              '${ImageNetworkBasePath.carouselSliderImage}/${state.defaultMovie.filmsList.elementAt(index).posterImage}',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                state.defaultMovie.filmsList.elementAt(index).title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.go(
                '/search/detail-film/${state.defaultMovie.filmsList.elementAt(index).id}');
          },
        ),
      )
    ],
  );
}