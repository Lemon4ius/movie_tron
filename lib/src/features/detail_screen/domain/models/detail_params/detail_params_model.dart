import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DetailParamsModel {
  final String language;

  DetailParamsModel(this.language);

  Map<String, dynamic> toMap() => {'language': language};
}