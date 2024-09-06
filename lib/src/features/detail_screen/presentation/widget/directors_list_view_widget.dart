import 'package:flutter/material.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/widget/person_list_widget.dart';

import '../bloc/detail_bloc.dart';

ConstrainedBox directorsListView(
    BuildContext context, DetailInitialState state) {
  return ConstrainedBox(
    constraints: BoxConstraints(
        maxHeight: 221, maxWidth: MediaQuery.of(context).size.width),
    child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          scrollDirection: Axis.horizontal,
          cacheExtent: 999,
          itemBuilder: (context, index) {
            return personsListView(
                state.personsList.crew.toList(), index, context);
          },
          itemCount: state.personsList.crew.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 32,
            );
          },
        )),
  );
}
