import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie/movie.dart';
import 'package:movies/domain/usecases/movie/get_now_playing_movies.dart';
part 'movie_now_playing_event.dart';
part 'movie_now_playing_state.dart';

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  MovieNowPlayingBloc(this._getNowPlayingMovies)
      : super(MovieNowPlayingEmpty()) {
    on<OnNowPlayingMoviesCalled>((event, emit) async {
      emit(MovieNowPlayingLoading());
      final result = await _getNowPlayingMovies.execute();
      result.fold(
        (failure) {
          emit(MovieNowPlayingError(failure.message));
        },
        (movieData) {
          emit(MovieNowPlayingHasData(movieData));
        },
      );
    });
  }
}
