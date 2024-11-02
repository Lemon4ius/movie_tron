import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_params/detail_params_model.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/widget/actors_list_view_widget.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/widget/companies_list_view_widget.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/widget/directors_list_view_widget.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/widget/plot_overview_widget.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/widget/sliver_header_delegate/detail_sliver_persistent_header_delegate.dart';

import '../../../../generated/l10n.dart';
import 'bloc/detail_bloc.dart';

class DetailPage extends StatelessWidget {
  final int idFilm;

  const DetailPage({super.key, required this.idFilm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: detailBody(),
    );
  }

  detailBody() {
    return SafeArea(
      child: BlocProvider(
        create: (context) => DetailBloc()
          ..add(DetailInitialEvent(idFilm,
              DetailParamsModel(Platform.localeName.replaceAll('_', '-')))),
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: DetailSliverPersistentHeaderDelegate(maxSize: 467)),
            )
          ];
        }, body: Builder(builder: (context) {
          return BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              if (state is DetailInitialState) {
                return CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                plotOverview(context, state),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 48, top: 18),
                                  child: Text(
                                    S.of(context).director,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                directorsListView(context, state),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 48, top: 18),
                                  child: Text(
                                    S.of(context).actors,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                actorsListView(context, state),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 48, top: 18),
                                  child: Text(
                                    S.of(context).companies,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                companiesListView(context, state),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          );
        })),
      ),
    );
  }
}
