import 'package:json_annotation/json_annotation.dart';

part 'detail_genre_model.g.dart';

@JsonSerializable()
class DetailGenreModel {
  final int id;
  final String name;

  DetailGenreModel(this.id, this.name);

  factory DetailGenreModel.fromJson(Map<String, dynamic> json) =>
      _$DetailGenreModelFromJson(json);
}
