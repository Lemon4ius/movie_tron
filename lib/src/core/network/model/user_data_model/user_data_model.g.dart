// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      json['client_id'] as String? ?? 'vP3FjAOJMWjzvjHzeADeGF5GQgbLZbY6',
      json['client_secret'] as String? ?? 'c7XqNvHtHylAQT0t',
      json['grant_type'] as String? ?? 'client_credentials',
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'grant_type': instance.grantType,
    };
