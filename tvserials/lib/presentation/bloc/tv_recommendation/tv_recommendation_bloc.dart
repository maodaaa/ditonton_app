import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_recommendations.dart';

part 'tv_recommendation_event.dart';
part 'tv_recommendation_state.dart';

class TvRecommendationBloc
    extends Bloc<TvRecommendationEvent, TvRecommendationState> {
  final GetTvSerialRecommendations _getTvSerialRecommendations;
  TvRecommendationBloc(this._getTvSerialRecommendations)
      : super(TvRecommendationEmpty()) {
    on<OnTvRecommendationCalled>((event, emit) async {
      final id = event.id;
      emit(TvRecommendationLoading());
      final detailResult = await _getTvSerialRecommendations.execute(id);
      detailResult.fold(
        (failure) {
          emit(TvRecommendationError(failure.message));
        },
        (tv) {
          emit(TvRecommendationHasData(tv));
        },
      );
    });
  }
}
