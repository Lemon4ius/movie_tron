import 'package:json_annotation/json_annotation.dart';
part 'popular_film_response.g.dart';

@JsonSerializable()
class PopularFilmResponse {
  final int id;
  final String title;
  @JsonKey(name: 'poster_path')
  final String posterImage;
  @JsonKey(name: 'vote_average')
  final int voteAverage;
  @JsonKey(name: 'release_date')
  final String releaseDate;

  PopularFilmResponse(this.id, this.title, this.posterImage, this.voteAverage,
      this.releaseDate);

  factory PopularFilmResponse.fromJson(Map<String, dynamic> json) => _$PopularFilmResponseFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularFilmResponse &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          posterImage == other.posterImage &&
          voteAverage == other.voteAverage &&
          releaseDate == other.releaseDate;

  @override
  int get hashCode =>
      title.hashCode ^
      posterImage.hashCode ^
      voteAverage.hashCode ^
      releaseDate.hashCode;
}
