// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_film_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularFilmResponse _$PopularFilmResponseFromJson(Map<String, dynamic> json) =>
    PopularFilmResponse(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['poster_path'] as String,
      (json['vote_average'] as num).toInt(),
      json['release_date'] as String,
    );

Map<String, dynamic> _$PopularFilmResponseToJson(
        PopularFilmResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterImage,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate,
    };
