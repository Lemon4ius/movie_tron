// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenModel _$UserTokenModelFromJson(Map<String, dynamic> json) =>
    UserTokenModel(
      json['token_type'] as String,
      json['access_token'] as String,
    );

Map<String, dynamic> _$UserTokenModelToJson(UserTokenModel instance) =>
    <String, dynamic>{
      'token_type': instance.token_type,
      'access_token': instance.access_token,
    };
