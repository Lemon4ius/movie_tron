// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_person_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailPersonResponse _$DetailPersonResponseFromJson(
        Map<String, dynamic> json) =>
    DetailPersonResponse(
      (json['id'] as num).toInt(),
      json['known_for_department'] as String?,
      json['name'] as String,
      json['character'] as String?,
      json['profile_path'] as String?,
      (json['gender'] as num).toInt(),
      json['job'] as String?,
    );

Map<String, dynamic> _$DetailPersonResponseToJson(
        DetailPersonResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'character': instance.character,
      'profile_path': instance.profilePath,
      'gender': instance.gender,
      'job': instance.job,
    };
