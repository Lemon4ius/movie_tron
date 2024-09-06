import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../bloc/detail_bloc.dart';

Padding plotOverview(BuildContext context, DetailInitialState state) {
  return Padding(
    padding: const EdgeInsets.only(left: 48, right: 48, top: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).plot,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            textAlign: TextAlign.start,
            state.detailFilm.overview,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    ),
  );
}