import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc.dart';
import 'movie_element_widget.dart';

Expanded tableMovieWidget() {
  return Expanded(
    child: BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadedDefaultMovieState) {
          return GridView.builder(
            itemCount: state.defaultMovie.filmsList.length,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                (MediaQuery.of(context).size.width / 200).floor(),
                childAspectRatio: 2 / 3.6,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
            itemBuilder: (context, index) =>
                movieElement(state, index, context),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
    ),
  );
}