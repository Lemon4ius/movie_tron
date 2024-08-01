import 'package:movie_tron/src/features/home_screen/data/api/get_popular_films_api.dart';
import 'package:movie_tron/src/features/home_screen/domain/repository/home_repository.dart';

import '../../domain/models/results_popular_list_films_responce/popular_list_film_response.dart';

class HomeRepoImpl implements HomeRepository {
  final GetPopularFilmsApi _getPopularFilmsApi = GetPopularFilmsApi();

  @override
  Future<PopularListFilmResponse> getPopularFilmsList(Map<String, dynamic> queries) async {
    return await _getPopularFilmsApi.getListFilms(queries);
  }
}
