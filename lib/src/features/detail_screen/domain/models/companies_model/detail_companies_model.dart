
import 'package:json_annotation/json_annotation.dart';

part 'detail_companies_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DetailCompaniesModel{
  final int id;
  final String? logoPath;
  final String name;

  DetailCompaniesModel(this.id, this.logoPath, this.name);

  factory DetailCompaniesModel.fromJson(Map<String, dynamic> json) => _$DetailCompaniesModelFromJson(json);
}