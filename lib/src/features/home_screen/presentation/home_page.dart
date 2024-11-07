import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tron/src/features/home_screen/domain/models/params_model/popular_params_model.dart';

import '../../../../generated/l10n.dart';
import '../../../core_ui/images/bottom_navigation/bottom_navigation_icon.dart';
import '../../../core_ui/models/bottom_nav_bar/bottom_nav_bar_model.dart';
import '../../../core_ui/widget/bottom_app_bar.dart';
import 'bloc/home_bloc.dart';
import 'widget/carousel_slider_widget.dart';
import 'widget/header_widget.dart';
import 'widget/search_widget.dart';
import 'widget/tiles_widget.dart';

class HomePage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomePage({super.key, required this.navigationShell});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(InitialEvent(PopularParamsModel(Platform.localeName.replaceAll('_', '-'), 1))),
      child: SafeArea(
        child: Scaffold(
          body: widget.navigationShell,
          bottomNavigationBar: AppBottomBar(
            navigationShell: widget.navigationShell,
            shadowContainerModel: [
              ShadowContainerModel(
                  icon: BottomNavigationIcon.homeIcon,
                  size: 0,
                  offset: 100,
                  isVisible: false),
              ShadowContainerModel(
                  icon: BottomNavigationIcon.playerIcon,
                  size: 0,
                  offset: 100,
                  isVisible: false),
              ShadowContainerModel(
                  icon: BottomNavigationIcon.searchIcon,
                  size: 0,
                  offset: 100,
                  isVisible: false),
              ShadowContainerModel(
                  icon: BottomNavigationIcon.profileIcon,
                  size: 0,
                  offset: 100,
                  isVisible: false),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBodyMainMenu extends StatelessWidget {
  const HomeBodyMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerWidget(context),
            Padding(
              padding: const EdgeInsets.only(top: 36, right: 48, left: 48),
              child: searchingWidget(context),
            ),
            ...tilesWidget(context),
            Padding(
              padding: const EdgeInsets.only(top: 36, left: 48),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: S.of(context).featured,
                    style: Theme.of(context).textTheme.headlineSmall),
                TextSpan(
                    text: S.of(context).series,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w300)),
              ])),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeInitialState) {
                  return CarouselSliderWidget(
                      state.popularFilmList, constraints);
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
    );
  }
}
