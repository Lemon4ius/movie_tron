import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_tron/src/features/home_screen/data/repo_impl/home_repo_impl.dart';
import 'package:movie_tron/src/features/home_screen/domain/repository/home_repository.dart';

import '../../domain/models/params_model/popular_params_model.dart';
import '../../domain/models/popular_film_response/popular_film_response.dart';


part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Set<PopularFilmResponse> popularParamsModelList = {};

  HomeBloc() : super(HomeInitial()) {
    final HomeRepository repository = HomeRepoImpl();
    on<InitialEvent>((event, emit) async {
      final popularFilmList = await repository
          .getPopularFilmsList(
          PopularParamsModel(event.popularParamsModel.language, event.popularParamsModel.page).toMap());
      popularParamsModelList.addAll(popularFilmList.filmsList);
      emit(HomeInitialState(popularParamsModelList));
    });
  }
}
