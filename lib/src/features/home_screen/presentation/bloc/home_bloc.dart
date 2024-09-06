import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_tron/src/core/base_di/base_di.dart';
import 'package:movie_tron/src/features/home_screen/domain/repository/home_repository.dart';

import '../../domain/models/params_model/popular_params_model.dart';
import '../../domain/models/popular_film_response/popular_film_response.dart';

part 'home_event.dart';part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Set<PopularFilmResponse> popularParamsModelList = {};

  HomeRepository repository = getIt.get<HomeRepository>();
  HomeBloc() : super(HomeInitial()) {
    on<InitialEvent>((event, emit) async {
      final popularFilmList = await repository.getPopularFilmsList(
          PopularParamsModel(event.popularParamsModel.language,
                  event.popularParamsModel.page)
              .toMap());
      popularParamsModelList.addAll(popularFilmList.filmsList);
      emit(HomeInitialState(popularFilmList:  popularParamsModelList,));
    });
  }
}
