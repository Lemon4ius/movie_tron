
import 'package:json_annotation/json_annotation.dart';
part 'detail_person_response.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class DetailPersonResponse{
  final int id;
  final String? knownForDepartment;
  final String name;
  final String? character;
  final String? profilePath;
  final int gender;
  final String? job;

  DetailPersonResponse(this.id, this.knownForDepartment, this.name,
      this.character, this.profilePath, this.gender, this.job);

  factory DetailPersonResponse.fromJson(Map<String,dynamic> json) => _$DetailPersonResponseFromJson(json);

}