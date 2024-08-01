// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_list_film_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularListFilmResponse _$PopularListFilmResponseFromJson(
        Map<String, dynamic> json) =>
    PopularListFilmResponse(
      (json['results'] as List<dynamic>)
          .map((e) => PopularFilmResponse.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$PopularListFilmResponseToJson(
        PopularListFilmResponse instance) =>
    <String, dynamic>{
      'results': instance.filmsList.toList(),
    };
