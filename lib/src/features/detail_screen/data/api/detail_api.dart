import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_film_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/base_dio/base_dio.dart';
import '../../domain/models/detail_person_response/detail_person_model_list.dart';

part 'detail_api.g.dart';

@injectable
@RestApi()
abstract class DetailApi {
  @factoryMethod
  factory DetailApi() {
    BaseDio baseDio = BaseDio();
    return _DetailApi(baseDio.dio);
  }

  @GET('movie/{movie_id}')
  Future<DetailFilmResponse> getBackgroundImage(
      @Path('movie_id') int id, @Queries() Map<String, dynamic> queries);

  @GET('movie/{movie_id}/credits')
  Future<DetailPersonModelList> getPersons(
      @Path('movie_id') int id, @Queries() Map<String, dynamic> queries);
}
