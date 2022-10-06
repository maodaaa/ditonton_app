import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_top_rated_tv.dart';

part 'top_rated_tv_event.dart';
part 'top_rated_tv_state.dart';

class TopRatedTvBloc extends Bloc<TopRatedTvEvent, TopRatedTvState> {
  final GetTopRatedTvSerials _getTopRatedTvSerials;

  TopRatedTvBloc(this._getTopRatedTvSerials) : super(TopRatedTvEmpty()) {
    on<OnTopRatedTvCalled>((event, emit) async {
      emit(TopRatedTvLoading());
      final result = await _getTopRatedTvSerials.execute();
      result.fold(
        (failure) {
          emit(TopRatedTvError(failure.message));
        },
        (tv) {
          emit(TopRatedTvHasData(tv));
        },
      );
    });
  }
}
