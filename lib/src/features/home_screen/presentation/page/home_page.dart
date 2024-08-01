import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tron/src/features/home_screen/domain/models/params_model/popular_params_model.dart';

import '../../../../core_ui/widget/bottom_app_bar.dart';
import '../bloc/home_bloc.dart';
import '../widget/carousel_slider_widget.dart';
import '../widget/header_widget.dart';
import '../widget/search_widget.dart';
import '../widget/tiles_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomBar(),
      body: BlocProvider(
        create: (context) =>
        HomeBloc()
          ..add(InitialEvent(PopularParamsModel(Platform.localeName, 1))),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) =>
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headerWidget(context),
                      searchingWidget(context),
                      ...tilesWidget(context),
                      Padding(
                        padding: const EdgeInsets.only(top: 36, left: 48),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Featured ',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: 'Series',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall),
                            ])),
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is HomeInitialState) {
                            return CarouselSliderWidget(state.popularFilmList,
                                constraints);
                          }
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        },
                      )
                    ],
                  ),

                ),
          ),

        ),
      ),
    );
  }
}
