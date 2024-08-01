import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  @JsonKey(name: 'client_id')
  final String clientId;
  @JsonKey(name: 'client_secret')
  final String clientSecret;
  @JsonKey(name: 'grant_type')
  final String grantType;

  UserDataModel(
      [this.clientId = 'vP3FjAOJMWjzvjHzeADeGF5GQgbLZbY6',
      this.clientSecret = 'c7XqNvHtHylAQT0t',
      this.grantType = 'client_credentials']);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
