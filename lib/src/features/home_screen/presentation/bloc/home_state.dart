part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeInitialState extends HomeState {
  final Set<PopularFilmResponse> popularFilmList;

  HomeInitialState({required this.popularFilmList,});
}
