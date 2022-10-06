import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_popular_tv.dart';

part 'popular_tv_event.dart';
part 'popular_tv_state.dart';

class PopularTvBloc extends Bloc<PopularTvEvent, PopularTvState> {
  final GetPopularTvSerials _getPopularTvSerials;

  PopularTvBloc(this._getPopularTvSerials) : super(PopularTvEmpty()) {
    on<OnPopularTvCalled>((event, emit) async {
      emit(PopularTvLoading());
      final result = await _getPopularTvSerials.execute();
      result.fold(
        (failure) {
          emit(PopularTvError(failure.message));
        },
        (movieData) {
          emit(PopularTvHasData(movieData));
        },
      );
    });
  }
}
