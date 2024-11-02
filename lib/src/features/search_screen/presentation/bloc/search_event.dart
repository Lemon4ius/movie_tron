part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchInitialEvent extends SearchEvent{
  final PopularParamsModel popularParamsModel;

  SearchInitialEvent(this.popularParamsModel);
}
