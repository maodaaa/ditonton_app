part of 'watchlist_movie_bloc.dart';

abstract class MovieWatchListEvent extends Equatable {}

class OnGetMovieWatchListStatus extends MovieWatchListEvent {
  final int id;
  OnGetMovieWatchListStatus(this.id);
  @override
  List<Object> get props => [id];
}

class OnMovieWatchListCalled extends MovieWatchListEvent {
  @override
  List<Object> get props => [];
}

class OnAddMovieCalled extends MovieWatchListEvent {
  final MovieDetail movieDetail;
  OnAddMovieCalled(this.movieDetail);
  @override
  List<Object> get props => [movieDetail];
}

class OnRemoveMovieCalled extends MovieWatchListEvent {
  final MovieDetail movieDetail;
  OnRemoveMovieCalled(this.movieDetail);
  @override
  List<Object> get props => [movieDetail];
}
