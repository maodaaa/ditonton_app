part of 'movie_detail_bloc.dart';

//Movie Detail Event
abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class OnDetailCalled extends MovieDetailEvent {
  final int id;

  const OnDetailCalled(this.id);

  @override
  List<Object> get props => [id];
}
