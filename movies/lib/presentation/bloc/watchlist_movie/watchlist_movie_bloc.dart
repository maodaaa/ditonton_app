import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie/movie.dart';
import 'package:movies/domain/entities/movie/movie_detail.dart';
import 'package:movies/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:movies/domain/usecases/movie/get_watchlist_status.dart';
import 'package:movies/domain/usecases/movie/remove_watchlist.dart';
import 'package:movies/domain/usecases/movie/save_watchlist.dart';

part 'watchlist_movie_event.dart';
part 'watchlist_movie_state.dart';

class MovieWatchListBloc
    extends Bloc<MovieWatchListEvent, MovieWatchListState> {
  final GetWatchListStatus _getWatchListStatus;
  final GetWatchlistMovies _getWatchlistMovies;
  final SaveWatchlist _saveWatchlist;
  final RemoveWatchlist _removeWatchlist;

  MovieWatchListBloc(this._getWatchListStatus, this._getWatchlistMovies,
      this._saveWatchlist, this._removeWatchlist)
      : super(MovieWatchListEmpty()) {
    on<OnGetMovieWatchListStatus>((event, emit) async {
      final result = await _getWatchListStatus.execute(event.id);
      emit(MovieWatchListStatus(result));
    });
    on<OnMovieWatchListCalled>((event, emit) async {
      emit(MovieWatchListLoading());
      final result = await _getWatchlistMovies.execute();
      result.fold(
        (failure) {
          emit(MovieWatchListError(failure.message));
        },
        (movies) {
          emit(MovieWatchListHasData(movies));
        },
      );
    });

    on<OnAddMovieCalled>(
      ((event, emit) async {
        final result = await _saveWatchlist.execute(event.movieDetail);

        result.fold(
          (failure) {
            emit(MovieWatchListError(failure.message));
          },
          (movies) {
            emit(MovieWatchListMassage(movies));
          },
        );
        add(OnGetMovieWatchListStatus(event.movieDetail.id));
      }),
    );
    on<OnRemoveMovieCalled>(
      ((event, emit) async {
        final result = await _removeWatchlist.execute(event.movieDetail);
        result.fold(
          (failure) {
            emit(MovieWatchListError(failure.message));
          },
          (movies) {
            emit(MovieWatchListMassage(movies));
          },
        );
        add(OnGetMovieWatchListStatus(event.movieDetail.id));
      }),
    );
  }
}
