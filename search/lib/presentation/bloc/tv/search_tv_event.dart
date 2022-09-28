part of 'search_tv_bloc.dart';

abstract class SearchTvSerialsEvent extends Equatable {
  const SearchTvSerialsEvent();

  @override
  List<Object> get props => [];
}

class OnQueryChanged extends SearchTvSerialsEvent {
  final String query;

  const OnQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}
