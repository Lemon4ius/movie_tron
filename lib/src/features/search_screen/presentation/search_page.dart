import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tron/src/features/home_screen/domain/models/params_model/popular_params_model.dart';
import 'package:movie_tron/src/features/search_screen/presentation/widget/sliver_persistent_header/search_sliver_persistent_header.dart';

import 'bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //TODO Изменить на динамический (язык,страница)
      create: (context) => SearchBloc()
        ..add(SearchInitialEvent(PopularParamsModel('ru-Rus', 1))),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverPersistentHeader(
                    pinned: true,
                    delegate: SearchSliverPersistentHeader(
                      maxSize: 300,
                    )),
              )
            ];
          },
          body: Builder(
            builder: (sliverContext) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        sliverContext),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.red,)
                  )
                ],
              );
            }
          ),
          // body: Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(
          //           top: 32, right: 16, left: 16, bottom: 11),
          //       child: searchingWidget(context),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(
          //           left: 16, right: 16, top: 14, bottom: 26),
          //       child: Wrap(
          //         spacing: 16,
          //         runSpacing: 14,
          //         alignment: WrapAlignment.center,
          //         direction: Axis.horizontal,
          //         children: [
          //           for (var i = 0; i < genreList.length; i++)
          //             filterChipWidget(genreList[i]),
          //         ],
          //       ),
          //     ),
          //     tableMovieWidget(),
          //   ],
          // ),
        ),
      ),
    );
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
        style: TextStyle(color: Colors.white),
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
