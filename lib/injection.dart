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
import 'package:movies/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movies/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:movies/presentation/bloc/movie_recommendation/movie_recommendation_bloc.dart';
import 'package:movies/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movies/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:movies/presentation/bloc/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:tvserials/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_popular_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_detail.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv_status.dart';
import 'package:tvserials/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:tvserials/domain/usecases/tv/save_watchlist_tv.dart';
import 'package:tvserials/presentation/bloc/popular_tv/popular_tv_bloc.dart';
import 'package:tvserials/presentation/bloc/top_rated_tv/top_rated_tv_bloc.dart';
import 'package:tvserials/presentation/bloc/tv_detail/tv_detail_bloc.dart';
import 'package:tvserials/presentation/bloc/tv_now_playing/tv_now_playing_bloc.dart';
import 'package:tvserials/presentation/bloc/tv_recommendation/tv_recommendation_bloc.dart';
import 'package:tvserials/presentation/bloc/watchlist_tv/watchlist_tv_bloc.dart';
import 'package:tvserials/domain/repositories/tv_repository.dart';
import 'package:search/presentation/bloc/movie/search_movies_bloc.dart';
import 'package:search/presentation/bloc/tv/search_tv_bloc.dart';
import 'package:search/search.dart';

final locator = GetIt.instance;

void init() {
  //Search Movies Bloc
  locator.registerFactory(
    () => SearchMoviesBloc(
      locator(),
    ),
  );
  //Search Tv Serials Bloc
  locator.registerFactory(
    () => SearchTvSerialsBloc(
      locator(),
    ),
  );
  // Movies Bloc
  locator.registerFactory(
    () => MovieNowPlayingBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchListMovieBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieRecommendationBloc(
      locator(),
    ),
  );
  //Tv Bloc
  locator.registerFactory(
    () => TvNowPlayingBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvDetailBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchListTvBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvRecommendationBloc(
      locator(),
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
