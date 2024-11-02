import '../../../home_screen/domain/models/results_popular_list_films_responce/popular_list_film_response.dart';

abstract class SearchRepository {
  Future<PopularListFilmResponse> getDefaultPictures(Map<String, dynamic> queries);
}
