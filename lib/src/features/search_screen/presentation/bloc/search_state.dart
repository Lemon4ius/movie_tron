part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoadedDefaultMovieState extends SearchState {
  final PopularListFilmResponse defaultMovie;

  SearchLoadedDefaultMovieState(this.defaultMovie);
}



