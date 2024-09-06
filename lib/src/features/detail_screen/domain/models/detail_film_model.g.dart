// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_film_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailFilmResponse _$DetailFilmResponseFromJson(Map<String, dynamic> json) =>
    DetailFilmResponse(
      json['backdrop_path'] as String,
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['vote_average'] as num).toDouble(),
      json['overview'] as String,
      (json['genres'] as List<dynamic>)
          .map((e) => DetailGenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['release_date'] as String,
      (json['production_companies'] as List<dynamic>)
          .map((e) => DetailCompaniesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailFilmResponseToJson(DetailFilmResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'genres': instance.genres,
      'production_companies': instance.productionCompanies,
    };
