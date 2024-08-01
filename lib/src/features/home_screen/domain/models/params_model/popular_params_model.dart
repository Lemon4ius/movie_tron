class PopularParamsModel {
  final String language;
  final int page;

  PopularParamsModel(this.language, this.page);

  Map<String, dynamic> toMap() => {'language': language, 'page': page};
}
