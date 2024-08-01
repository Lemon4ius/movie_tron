import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_screen/presentation/bloc/home_bloc.dart';

filmCardWidget(BuildContext context, int index) {
  return Stack(children: [
    Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitialState) {
            return filmCard(context, state, index);
          } else {
            return Container();
          }
        },
      ),
    ),
    Positioned.fill(
      child: Material(
          color: Colors.transparent,
          child:
              InkWell(borderRadius: BorderRadius.circular(12), onTap: () {})),
    ),
  ]);
}

Column filmCard(BuildContext context, HomeInitialState state, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        child: Image.network(
          'https://image.tmdb.org/t/p/w780/${state.popularFilmList.elementAt(index).posterImage}',
          fit: BoxFit.fill,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          state.popularFilmList.elementAt(index).title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          state.popularFilmList.elementAt(index).releaseDate.substring(0, 4),
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
