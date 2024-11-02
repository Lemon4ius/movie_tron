import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movie_tron/src/core/base_di/base_di.dart';
import 'package:movie_tron/src/features/home_screen/domain/models/params_model/popular_params_model.dart';
import 'package:movie_tron/src/features/home_screen/domain/models/results_popular_list_films_responce/popular_list_film_response.dart';
import 'package:movie_tron/src/features/search_screen/domain/repository/search_repository.dart';

part 'search_event.dart';

part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final searchRepository = getIt.get<SearchRepository>();

  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async{
      if (event is SearchInitialEvent) {
        final defaultMovie = await searchRepository.getDefaultPictures(event.popularParamsModel.toMap());
        emit(SearchLoadedDefaultMovieState(defaultMovie));
      }
    });
  }
}
