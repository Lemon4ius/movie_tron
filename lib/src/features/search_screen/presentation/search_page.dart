import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tron/src/features/home_screen/domain/models/params_model/popular_params_model.dart';
import 'package:movie_tron/src/features/search_screen/presentation/widget/movie_element_widget.dart';
import 'package:movie_tron/src/features/search_screen/presentation/widget/sliver_persistent_header/search_sliver_persistent_header.dart';

import 'bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var isSelected = false;
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //TODO Изменить на динамический (язык,страница)
      create: (context) => SearchBloc()
        ..add(SearchInitialEvent(PopularParamsModel('ru-Rus', 1))),
      child: Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            scrollPhysicsNestedScrollView(scrollNotification);
            return false;
          },
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchLoadedDefaultMovieState) {
                return NestedScrollView(
                  controller: _controller,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverPersistentHeader(
                            floating: true,
                            pinned: true,
                            delegate: SearchSliverPersistentHeader(
                              maxSize: 240,
                            )),
                      )
                    ];
                  },
                  body: Builder(builder: (sliverContext) {
                    return CustomScrollView(
                      slivers: [
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  sliverContext),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          sliver: SliverGrid.builder(
                            itemCount: state.defaultMovie.filmsList.length,
                            // clipBehavior: Clip.hardEdge,
                            // padding:
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        (MediaQuery.of(context).size.width /
                                                200)
                                            .floor(),
                                    childAspectRatio: 2 / 3.6,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16),
                            itemBuilder: (context, index) =>
                                movieElement(state, index, context),
                          ),
                        ),
                        // SliverGrid.builder(
                        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //       crossAxisCount:
                        //           (MediaQuery.of(context).size.width / 200)
                        //               .floor(),
                        //       childAspectRatio: 2 / 3.6,
                        //       crossAxisSpacing: 16,
                        //       mainAxisSpacing: 16),
                        //   itemBuilder: (context, index) {
                        //     return Container(
                        //       color: Colors.red,
                        //     );
                        //   },
                        //   itemCount: 10,
                        // )
                      ],
                    );
                  }),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
            },
          ),
        ),
      ),
    );
  }

  scrollPhysicsNestedScrollView(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollEndNotification &&
        scrollNotification.depth == 0) {
      final minExtent = scrollNotification.metrics.minScrollExtent;
      final maxExtent = scrollNotification.metrics.maxScrollExtent;
      final middle = (maxExtent - minExtent) / 2;
      final pos = scrollNotification.metrics.pixels;
      double? scrollTo;

      if (minExtent < pos && pos <= middle) {
        scrollTo = minExtent;
      } else if (middle < pos && pos < maxExtent) {
        scrollTo = maxExtent;
      }
      if (scrollTo != null) {
        Timer(
            const Duration(milliseconds: 1),
            () => _controller.animateTo(scrollTo!,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease));
      }
    }
  }

  filterChipWidget(GenreChip genre) {
    return FilterChip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      disabledColor: const Color.fromRGBO(81, 83, 93, 0.25),
      backgroundColor: const Color.fromRGBO(81, 83, 93, 0.25),
      checkmarkColor: Colors.white,
      selectedColor: const Color.fromRGBO(81, 83, 93, 1),
      selected: genre.selected,
      label: Text(
        genre.label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      onSelected: (value) {
        setState(() {
          genre.selected = value;
        });
        // value = false;
      },
    );
  }
}

class GenreChip {
  String label;
  bool selected;

  GenreChip({required this.label, required this.selected});
}
