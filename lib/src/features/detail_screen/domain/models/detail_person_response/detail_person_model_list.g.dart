// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_person_model_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailPersonModelList _$DetailPersonModelListFromJson(
        Map<String, dynamic> json) =>
    DetailPersonModelList(
      (json['cast'] as List<dynamic>)
          .map((e) => DetailPersonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>)
          .map((e) => DetailPersonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailPersonModelListToJson(
        DetailPersonModelList instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
    };
