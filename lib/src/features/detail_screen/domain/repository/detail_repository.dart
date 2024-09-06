import 'package:movie_tron/src/features/detail_screen/domain/models/detail_params/detail_params_model.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_person_response/detail_person_model_list.dart';

import '../models/detail_film_model.dart';

abstract class DetailRepository{
  Future<DetailFilmResponse> getDetailFilm(int id, DetailParamsModel params);
  Future<DetailPersonModelList> getPersons(int id, DetailParamsModel params);
}