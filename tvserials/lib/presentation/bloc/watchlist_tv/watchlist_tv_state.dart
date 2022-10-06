part of 'watchlist_tv_bloc.dart';

abstract class TvWatchListState extends Equatable {
  const TvWatchListState();

  @override
  List<Object> get props => [];
}

class TvWatchListStatus extends TvWatchListState {
  final bool isAddedToWatchlist;
  const TvWatchListStatus(this.isAddedToWatchlist);
  @override
  List<Object> get props => [isAddedToWatchlist];
}

class TvWatchListMassage extends TvWatchListState {
  final String massage;
  const TvWatchListMassage(this.massage);
  @override
  List<Object> get props => [massage];
}

class TvWatchListEmpty extends TvWatchListState {}

class TvWatchListLoading extends TvWatchListState {}

class TvWatchListError extends TvWatchListState {
  final String message;

  const TvWatchListError(this.message);

  @override
  List<Object> get props => [message];
}

class TvWatchListHasData extends TvWatchListState {
  final List<TvSerial> result;

  const TvWatchListHasData(this.result);

  @override
  List<Object> get props => [result];
}
