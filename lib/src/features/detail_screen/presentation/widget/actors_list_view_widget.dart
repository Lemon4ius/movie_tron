import 'package:flutter/material.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/widget/person_list_widget.dart';

import '../bloc/detail_bloc.dart';

Padding actorsListView(BuildContext context, DetailInitialState state) {
  return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 221,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          scrollDirection: Axis.horizontal,
          cacheExtent: 999,
          itemBuilder: (context, index) {
            return personsListView(state.personsList.cast, index, context);
          },
          itemCount: state.personsList.cast.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 32,
            );
          },
        ),
      ));
}