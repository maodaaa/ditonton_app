import 'package:http/http.dart' as http;
import 'package:core/data/datasources/db/database_helper_tv_serial.dart';
import 'package:core/data/repositories/tv_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:core/data/datasources/db/database_helper_movie.dart';
import 'package:core/data/datasources/movie/movie_local_data_source.dart';
import 'package:core/data/datasources/movie/movie_remote_data_source.dart';
import 'package:core/data/datasources/tv/tv_local_data_source.dart';
import 'package:core/data/datasources/tv/tv_remote_data_source.dart';
import 'package:core/data/repositories/movie_repository_impl.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:movies/domain/usecases/movie/get_movie_detail.dart';
import 'package:movies/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:movies/domain/usecases/movie/get_popular_movies.dart';
import 'package:movies/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:movies/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:movies/domain/usecases/movie/get_watchlist_status.dart';
import 'package:movies/domain/usecases/movie/remove_watchlist.dart';
import 'package:movies/domain/usecases/movie/save_watchlist.dart';
import 'package:movies/presentation/provider/movie/movie_detail_notifier.dart';
import 'package:movies/presentation/provider/movie/movie_list_notifier.dart';
import 'package:movies/presentation/provider/movie/popular_movies_notifier.dart';
import 'package:movies/presentation/provider/movie/top_rated_movies_notifier.dart';
import 'package:movies/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:tvserials/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_popular_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_detail.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv_status.dart';
import 'package:tvserials/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:tvserials/domain/usecases/tv/save_watchlist_tv.dart';
import 'package:tvserials/presentation/provider/tv/watchlist_tv_notifier.dart';
import 'package:tvserials/presentation/provider/tv/popular_tv_notifier.dart';
import 'package:tvserials/presentation/provider/tv/top_rated_tv_notifier.dart';
import 'package:tvserials/presentation/provider/tv/tv_detail_notifier.dart';
import 'package:tvserials/presentation/provider/tv/tv_list_notifier.dart';
import 'package:tvserials/domain/repositories/tv_repository.dart';
import 'package:search/presentation/bloc/movie/search_movies_bloc.dart';
import 'package:search/presentation/bloc/tv/search_tv_bloc.dart';
import 'package:search/search.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
    () => SearchMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SearchTvSerialsBloc(
      locator(),
    ),
  );
  // provider
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  //Tv List Provider
  locator.registerFactory(
    () => TvSerialListNotifier(
      getNowPlayingTvSerials: locator(),
      getPopularTvSerials: locator(),
      getTopRatedTvSerials: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  //Tv Detail Provider
  locator.registerFactory(
    () => TvSerialDetailNotifier(
      getTvSerialDetail: locator(),
      getTvSerialRecommendations: locator(),
      getWatchListTvSerialStatus: locator(),
      saveWatchlistTvSerial: locator(),
      removeWatchlistTvSerial: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  //Popular Tv Provider
  locator.registerFactory(
    () => PopularTvSerialsNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  //Top Rated Tv Provider
  locator.registerFactory(
    () => TopRatedTvSerialsNotifier(
      getTopRatedTvSerials: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  //Watch List Tv Provider
  locator.registerFactory(
    () => WatchlistTvNotifier(
      getWatchlistTvSerial: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  //use case Tv
  locator.registerLazySingleton(() => GetNowPlayingTvSerials(locator()));
  locator.registerLazySingleton(() => GetPopularTvSerials(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSerials(locator()));
  locator.registerLazySingleton(() => GetTvSerialDetail(locator()));
  locator.registerLazySingleton(() => GetTvSerialRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvSerials(locator()));
  locator.registerLazySingleton(() => GetWatchListTvSerialStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSerial(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSerial(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSerial(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  // repository tv
  locator.registerLazySingleton<TvSerialRepository>(
    () => TvSerialRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelperMovie: locator()));

  //tv data sources
  locator.registerLazySingleton<TvSerialRemoteDataSource>(
      () => TvSerialRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSerialLocalDataSource>(
      () => TvSerialLocalDataSourceImpl(databaseHelperTvSerial: locator()));

  // helper
  locator
      .registerLazySingleton<DatabaseHelperMovie>(() => DatabaseHelperMovie());
  locator.registerLazySingleton<DatabaseHelperTvSerial>(
      () => DatabaseHelperTvSerial());

  // external
  locator.registerLazySingleton(() => http.Client());
}
