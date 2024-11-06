import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_tron/src/core_ui/colors/app_colors.dart';
import 'package:movie_tron/src/features/home_screen/presentation/widget/search_widget.dart';
import 'package:movie_tron/src/features/search_screen/presentation/widget/filter_chip_widget.dart';

import '../../search_page.dart';

class SearchSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  final double maxSize;
  final genreList = [
    GenreChip(label: 'Fantasy', selected: false),
    GenreChip(label: 'Drama', selected: false),
    GenreChip(label: 'Comedy', selected: false),
    GenreChip(label: 'Historical', selected: false),
    GenreChip(label: 'Horror', selected: false),
    GenreChip(label: 'Musical', selected: false),
    GenreChip(label: 'Romance', selected: false),
    GenreChip(label: 'Science fiction', selected: false),
    GenreChip(label: 'Thriller', selected: false),
    GenreChip(label: 'Western', selected: false),
  ];

  SearchSliverPersistentHeader({
    required this.maxSize,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    debugPrint(progress.toString());
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AnimatedContainer(
          color: AppColors.mainBackgroundColor,
          alignment: Alignment.topCenter,
          duration: Duration.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: searchingWidget(context),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: AnimatedContainer(
              alignment: Alignment.bottomCenter,
              duration: Duration.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 14,
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    for (var i = 0; i < genreList.length; i++)
                      FilterChipWidget(
                        genre: genreList[i],
                      )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => maxSize;

  @override
  double get minExtent => 85;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
