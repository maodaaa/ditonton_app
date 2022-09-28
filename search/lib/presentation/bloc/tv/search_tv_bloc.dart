import 'package:core/domain/entities/tv/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/domain/usecase/tv/search_tv.dart';
import 'package:search/presentation/bloc/event_transformer.dart';

part 'search_tv_event.dart';
part 'search_tv_state.dart';

class SearchTvSerialsBloc
    extends Bloc<SearchTvSerialsEvent, SearchTvSerialsState> {
  final SearchTvSerials _searchTvSerials;
  SearchTvSerialsBloc(this._searchTvSerials) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchLoading());
      final result = await _searchTvSerials.execute(query);

      result.fold(
        (failure) {
          emit(SearchError(failure.message));
        },
        (data) {
          emit(SearchHasData(data));
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}
