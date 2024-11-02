import 'package:injectable/injectable.dart';
import 'package:movie_tron/src/core/base_di/base_di.dart';
import 'package:movie_tron/src/features/search_screen/data/api/search_api.dart';
import 'package:movie_tron/src/features/search_screen/domain/repository/search_repository.dart';

import '../../../home_screen/domain/models/results_popular_list_films_responce/popular_list_film_response.dart';

@Injectable(as: SearchRepository)
class SearchRepoImpl implements SearchRepository {
  final _searchApi = getIt.get<SearchApi>();

  @override
  Future<PopularListFilmResponse> getDefaultPictures(Map<String, dynamic> queries) {
    return _searchApi.getListFilms(queries);
  }
}
