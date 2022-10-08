import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/entities/tv/tv_detail.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv_status.dart';
import 'package:tvserials/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:tvserials/domain/usecases/tv/save_watchlist_tv.dart';

part 'watchlist_tv_event.dart';
part 'watchlist_tv_state.dart';

class TvWatchListBloc extends Bloc<TvWatchListEvent, TvWatchListState> {
  final GetWatchListTvSerialStatus _getWatchListTvSerialStatus;
  final GetWatchlistTvSerial _getWatchlistTvSerial;
  final SaveWatchlistTvSerial _saveWatchlistTvSerial;
  final RemoveWatchlistTvSerial _removeWatchlistTvSerial;

  TvWatchListBloc(this._getWatchListTvSerialStatus, this._getWatchlistTvSerial,
      this._saveWatchlistTvSerial, this._removeWatchlistTvSerial)
      : super(TvWatchListEmpty()) {
    on<OnGetTvWatchListStatus>((event, emit) async {
      final result = await _getWatchListTvSerialStatus.execute(event.id);
      emit(TvWatchListStatus(result));
    });

    on<OnTvWatchListCalled>((event, emit) async {
      emit(TvWatchListLoading());
      final result = await _getWatchlistTvSerial.execute();
      result.fold(
        (failure) {
          emit(TvWatchListError(failure.message));
        },
        (tv) {
          emit(TvWatchListHasData(tv));
        },
      );
    });

    on<OnAddTvCalled>(
      ((event, emit) async {
        final result = await _saveWatchlistTvSerial.execute(event.tvDetail);

        result.fold(
          (failure) {
            emit(TvWatchListError(failure.message));
          },
          (tv) {
            emit(TvWatchListMassage(tv));
          },
        );
        add(OnGetTvWatchListStatus(event.tvDetail.id));
      }),
    );
    on<OnRemoveTvCalled>(
      ((event, emit) async {
        final result = await _removeWatchlistTvSerial.execute(event.tvDetail);

        result.fold(
          (failure) {
            emit(TvWatchListError(failure.message));
          },
          (tv) {
            emit(TvWatchListMassage(tv));
          },
        );
        add(OnGetTvWatchListStatus(event.tvDetail.id));
      }),
    );
  }
}
