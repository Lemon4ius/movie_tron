import 'package:json_annotation/json_annotation.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_genre_model/detail_genre_model.dart';

import 'companies_model/detail_companies_model.dart';

part 'detail_film_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DetailFilmResponse {
  final int id;
  final String backdropPath;
  final String title;
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final List<DetailGenreModel> genres;
  final List<DetailCompaniesModel> productionCompanies;

  DetailFilmResponse(this.backdropPath, this.id, this.title, this.voteAverage,
      this.overview, this.genres, this.releaseDate, this.productionCompanies);

  factory DetailFilmResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailFilmResponseFromJson(json);
}
