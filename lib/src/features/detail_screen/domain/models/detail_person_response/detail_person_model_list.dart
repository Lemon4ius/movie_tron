import 'package:json_annotation/json_annotation.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_person_response/detail_person_response.dart';

part 'detail_person_model_list.g.dart';

@JsonSerializable()
class DetailPersonModelList {
  final List<DetailPersonResponse> cast;
  final List<DetailPersonResponse> crew;

  DetailPersonModelList(this.cast, this.crew);

  factory DetailPersonModelList.fromJson(Map<String, dynamic> json) =>
      _$DetailPersonModelListFromJson(json);
}
