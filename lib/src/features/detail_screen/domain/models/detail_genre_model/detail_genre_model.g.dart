// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_genre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailGenreModel _$DetailGenreModelFromJson(Map<String, dynamic> json) =>
    DetailGenreModel(
      (json['id'] as num).toInt(),
      json['name'] as String,
    );

Map<String, dynamic> _$DetailGenreModelToJson(DetailGenreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
