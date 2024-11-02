import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/base_dio/base_dio.dart';
import '../../../home_screen/domain/models/results_popular_list_films_responce/popular_list_film_response.dart';
part 'search_api.g.dart';

@injectable
@RestApi()
abstract class SearchApi{
  @factoryMethod
  factory SearchApi() {
    BaseDio baseDio = BaseDio();
    return _SearchApi(baseDio.dio);
  }

  @GET('movie/popular')
  Future<PopularListFilmResponse> getListFilms(
      @Queries() Map<String, dynamic> queries);
}