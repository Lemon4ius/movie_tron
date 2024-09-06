part of 'detail_bloc.dart';

@immutable
sealed class DetailState {}

final class DetailInitial extends DetailState {}

class DetailInitialState extends DetailState{
  final DetailFilmResponse detailFilm;
  final DetailPersonModelList personsList;

  DetailInitialState(this.detailFilm,this.personsList);
}
