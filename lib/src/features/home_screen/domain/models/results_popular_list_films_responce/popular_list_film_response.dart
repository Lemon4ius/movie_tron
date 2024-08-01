import 'package:json_annotation/json_annotation.dart';

import '../popular_film_response/popular_film_response.dart';

part 'popular_list_film_response.g.dart';

@JsonSerializable()
class PopularListFilmResponse {
  @JsonKey(name: 'results')
  final Set<PopularFilmResponse> filmsList;

  PopularListFilmResponse(this.filmsList);

  factory PopularListFilmResponse.fromJson(Map<String, dynamic> json) => _$PopularListFilmResponseFromJson(json);
}
