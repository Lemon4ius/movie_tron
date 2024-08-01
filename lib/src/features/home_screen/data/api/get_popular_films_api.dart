import 'package:dio/dio.dart';
import 'package:movie_tron/src/core/network/base_dio/base_dio.dart';
import 'package:retrofit/http.dart';

import '../../domain/models/results_popular_list_films_responce/popular_list_film_response.dart';


part 'get_popular_films_api.g.dart';

@RestApi()
abstract class GetPopularFilmsApi {
  factory GetPopularFilmsApi() {
    BaseDio baseDio = BaseDio();
    return _GetPopularFilmsApi(baseDio.dio);
  }

  @GET('movie/popular')
  Future<PopularListFilmResponse> getListFilms(
      @Queries() Map<String, dynamic> queries);
}
