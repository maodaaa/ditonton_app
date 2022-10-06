part of 'watchlist_tv_bloc.dart';

abstract class TvWatchListEvent extends Equatable {}

class OnGetTvWatchListStatus extends TvWatchListEvent {
  final int id;
  OnGetTvWatchListStatus(this.id);
  @override
  List<Object> get props => [id];
}

class OnTvWatchListCalled extends TvWatchListEvent {
  @override
  List<Object> get props => [];
}

class OnAddTvCalled extends TvWatchListEvent {
  final TvSerialDetail tvDetail;
  OnAddTvCalled(this.tvDetail);
  @override
  List<Object> get props => [tvDetail];
}

class OnRemoveTvCalled extends TvWatchListEvent {
  final TvSerialDetail tvDetail;
  OnRemoveTvCalled(this.tvDetail);
  @override
  List<Object> get props => [tvDetail];
}
