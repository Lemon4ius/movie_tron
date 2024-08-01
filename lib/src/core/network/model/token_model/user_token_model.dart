import 'package:json_annotation/json_annotation.dart';

part 'user_token_model.g.dart';

@JsonSerializable()
class UserTokenModel{
  final String token_type;
  final String access_token;

  UserTokenModel(this.token_type, this.access_token);

  factory UserTokenModel.fromJson(Map<String, dynamic> json) => _$UserTokenModelFromJson(json);
}