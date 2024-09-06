import 'dart:async';

import '../models/results_popular_list_films_responce/popular_list_film_response.dart';

abstract class HomeRepository {
  Future<PopularListFilmResponse> getPopularFilmsList(Map<String, dynamic> queries);
}
