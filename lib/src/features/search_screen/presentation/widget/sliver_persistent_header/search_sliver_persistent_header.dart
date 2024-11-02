import 'package:flutter/material.dart';
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
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: searchingWidget(context),
            ),
            Padding(
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
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => maxSize;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
