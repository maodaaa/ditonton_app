import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvserials/domain/entities/tv/tv_detail.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_detail.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  final GetTvSerialDetail _getTvSerialDetail;
  TvDetailBloc(
    this._getTvSerialDetail,
  ) : super(TvDetailEmpty()) {
    on<OnTvDetailCalled>((event, emit) async {
      final id = event.id;
      emit(TvDetailLoading());
      final detailResult = await _getTvSerialDetail.execute(id);

      detailResult.fold(
        (failure) {
          emit(TvDetailError(failure.message));
        },
        (tv) {
          emit(TvDetailHasData(tv));
        },
      );
    });
  }
}
