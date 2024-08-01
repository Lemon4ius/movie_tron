part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class InitialEvent extends HomeEvent{
  final PopularParamsModel popularParamsModel;
  InitialEvent(this.popularParamsModel);
}

