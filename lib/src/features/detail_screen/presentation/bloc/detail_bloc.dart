import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_film_model.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_params/detail_params_model.dart';
import 'package:movie_tron/src/features/detail_screen/domain/models/detail_person_response/detail_person_model_list.dart';
import 'package:movie_tron/src/features/detail_screen/domain/repository/detail_repository.dart';

import '../../../../core/base_di/base_di.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository detailRepoImpl= getIt.get<DetailRepository>();
  DetailBloc() : super(DetailInitial()) {
    on<DetailInitialEvent>((event, emit) async{
      final detailFilm = await detailRepoImpl.getDetailFilm(event.id, event.detailParamsModel);
      final personsFilm = await detailRepoImpl.getPersons(event.id, event.detailParamsModel);
      personsFilm.cast.removeWhere((element) => element.knownForDepartment!='Acting',);
      personsFilm.crew.removeWhere((element) => element.job!='Director',);
      emit(DetailInitialState(detailFilm,personsFilm));
    });
  }
}
