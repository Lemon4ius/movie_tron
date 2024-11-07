import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_screen/domain/models/params_model/popular_params_model.dart';
import '../../home_screen/presentation/bloc/home_bloc.dart';
import 'widget/film_card_widget.dart';

class PopularFilmsPage extends StatelessWidget{
  const PopularFilmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }

}

class HomeBody extends StatelessWidget {
  final scrollController = ScrollController();
  var page = 1;

  HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(
          () {
        if (scrollController.position.atEdge) {
          bool isTop = scrollController.position.pixels == 0;
          if (!isTop) {
            page += 1;
            BlocProvider.of<HomeBloc>(context)
                .add(InitialEvent(PopularParamsModel('ru-Rus', page)));
          }
        }
      },
    );

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitialState) {
          return GridView.builder(
            controller: scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.1),
                mainAxisSpacing: 16),
            itemCount: state.popularFilmList.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return filmCardWidget(context, index);
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}