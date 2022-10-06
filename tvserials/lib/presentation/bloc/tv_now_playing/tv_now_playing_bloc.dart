import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_now_playing_tv.dart';
part 'tv_now_playing_event.dart';
part 'tv_now_playing_state.dart';

class TvNowPlayingBloc extends Bloc<TvNowPlayingEvent, TvNowPlayingState> {
  final GetNowPlayingTvSerials _getNowPlayingTvSerials;

  TvNowPlayingBloc(this._getNowPlayingTvSerials) : super(TvNowPlayingEmpty()) {
    on<OnNowPlayingTvCalled>((event, emit) async {
      emit(TvNowPlayingLoading());
      final result = await _getNowPlayingTvSerials.execute();
      result.fold(
        (failure) {
          emit(TvNowPlayingError(failure.message));
        },
        (tvData) {
          emit(TvNowPlayingHasData(tvData));
        },
      );
    });
  }
}
