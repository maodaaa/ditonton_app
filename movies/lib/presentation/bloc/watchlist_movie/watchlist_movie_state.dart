part of 'watchlist_movie_bloc.dart';

abstract class MovieWatchListState extends Equatable {
  const MovieWatchListState();

  @override
  List<Object> get props => [];
}

class MovieWatchListStatus extends MovieWatchListState {
  final bool isAddedToWatchlist;
  const MovieWatchListStatus(this.isAddedToWatchlist);
  @override
  List<Object> get props => [isAddedToWatchlist];
}

class MovieWatchListMassage extends MovieWatchListState {
  final String massage;
  const MovieWatchListMassage(this.massage);
  @override
  List<Object> get props => [massage];
}

class MovieWatchListEmpty extends MovieWatchListState {}

class MovieWatchListLoading extends MovieWatchListState {}

class MovieWatchListError extends MovieWatchListState {
  final String message;

  const MovieWatchListError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieWatchListHasData extends MovieWatchListState {
  final List<Movie> result;

  const MovieWatchListHasData(this.result);

  @override
  List<Object> get props => [result];
}
