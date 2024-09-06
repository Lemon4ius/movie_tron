import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tron/src/features/detail_screen/presentation/detail_page.dart';
import 'package:movie_tron/src/features/home_screen/presentation/home_page.dart';
import 'package:movie_tron/src/features/search_screen/presentation/search_page.dart';

import '../../features/profile_screen/presentation/profile_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return HomePage(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(navigatorKey: _sectionNavigatorKey, routes: [
              GoRoute(
                  path: '/',
                  builder: (context, state) => const HomeBodyMainMenu(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _sectionNavigatorKey,
                      name: 'detail',
                      path: 'detail-film/:id',
                      builder: (context, state) {
                        final filmId = state.pathParameters['id']!;
                        return DetailPage(idFilm: int.parse(filmId));
                      },
                    )
                  ]),
            ]),
            StatefulShellBranch( routes: [
              GoRoute(
                path: '/picture-list',
                builder: (context, state) => const Scaffold(
                  backgroundColor: Colors.amberAccent,
                ),
              ),
            ]),
            StatefulShellBranch( routes: [
              GoRoute(
                path: '/search',
                builder: (context, state) => SearchPage(),
              ),
            ]),
            StatefulShellBranch( routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => ProfilePage(),
              ),
            ])
          ]),
    ]);
