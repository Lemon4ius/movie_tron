import 'package:injectable/injectable.dart';
import 'package:movie_tron/src/core/base_di/base_di.dart';
import 'package:movie_tron/src/features/detail_screen/data/api/detail_api.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_film_model.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_params/detail_params_model.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_person_response/detail_person_model_list.dart';
import 'package:movie_tron/src/features/detail_screen/domain/repository/detail_repository.dart';

@Injectable(as: DetailRepository)
class DetailRepoImpl implements DetailRepository {
  final DetailApi api = getIt.get<DetailApi>();

  @override
  Future<DetailFilmResponse> getDetailFilm(id, queries) async {
    return await api.getBackgroundImage(id, queries.toMap());
  }

  @override
  Future<DetailPersonModelList> getPersons(
      int id, DetailParamsModel params) async {
    return await api.getPersons(id, params.toMap());
  }
}
