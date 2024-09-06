part of 'detail_bloc.dart';

@immutable
sealed class DetailEvent {}

class DetailInitialEvent extends DetailEvent {
  final int id;
  final DetailParamsModel detailParamsModel;

  DetailInitialEvent(this.id, this.detailParamsModel);
}
