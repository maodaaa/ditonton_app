import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie/movie.dart';
import 'package:movies/domain/usecases/movie/get_movie_recommendations.dart';

part 'movie_recommendation_event.dart';
part 'movie_recommendation_state.dart';

class MovieRecommendationBloc
    extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  final GetMovieRecommendations _getMovieRecommendations;
  MovieRecommendationBloc(this._getMovieRecommendations)
      : super(MovieRecommendationEmpty()) {
    on<OnRecommendationCalled>((event, emit) async {
      final id = event.id;
      emit(MovieRecommendationLoading());
      final detailResult = await _getMovieRecommendations.execute(id);
      detailResult.fold(
        (failure) {
          emit(MovieRecommendationError(failure.message));
        },
        (movies) {
          emit(MovieRecommendationHasData(movies));
        },
      );
    });
  }
}
