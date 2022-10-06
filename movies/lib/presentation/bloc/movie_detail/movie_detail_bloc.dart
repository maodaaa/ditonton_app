import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie/movie_detail.dart';
import 'package:movies/domain/usecases/movie/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail _getMovieDetail;
  MovieDetailBloc(
    this._getMovieDetail,
  ) : super(MovieDetailEmpty()) {
    on<OnDetailCalled>((event, emit) async {
      final id = event.id;
      emit(MovieDetailLoading());
      final detailResult = await _getMovieDetail.execute(id);

      detailResult.fold(
        (failure) {
          emit(MovieDetailError(failure.message));
        },
        (movie) {
          emit(MovieDetailHasData(movie));
        },
      );
    });
  }
}
