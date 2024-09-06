// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_companies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailCompaniesModel _$DetailCompaniesModelFromJson(
        Map<String, dynamic> json) =>
    DetailCompaniesModel(
      (json['id'] as num).toInt(),
      json['logo_path'] as String?,
      json['name'] as String,
    );

Map<String, dynamic> _$DetailCompaniesModelToJson(
        DetailCompaniesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
    };
