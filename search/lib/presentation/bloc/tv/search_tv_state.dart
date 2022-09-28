part of 'search_tv_bloc.dart';

abstract class SearchTvSerialsState extends Equatable {
  const SearchTvSerialsState();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends SearchTvSerialsState {}

class SearchLoading extends SearchTvSerialsState {}

class SearchError extends SearchTvSerialsState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchHasData extends SearchTvSerialsState {
  final List<TvSerial> result;

  const SearchHasData(this.result);

  @override
  List<Object> get props => [result];
}
