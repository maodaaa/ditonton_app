import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movies/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:movies/presentation/bloc/movie_recommendation/movie_recommendation_bloc.dart';
import 'package:movies/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movies/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:movies/presentation/bloc/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:search/search.dart';
import 'package:core/presentation/pages/watchlist_page.dart';
import 'package:search/presentation/bloc/movie/search_movies_bloc.dart';
import 'package:search/presentation/bloc/tv/search_tv_bloc.dart';
import 'package:movies/presentation/pages/movie/movie_detail_page.dart';
import 'package:movies/presentation/pages/movie/home_movie_page.dart';
import 'package:movies/presentation/pages/movie/popular_movies_page.dart';
import 'package:movies/presentation/pages/movie/top_rated_movies_page.dart';
import 'package:tvserials/presentation/bloc/popular_tv/popular_tv_bloc.dart';
import 'package:tvserials/presentation/bloc/top_rated_tv/top_rated_tv_bloc.dart';
import 'package:tvserials/presentation/bloc/tv_detail/tv_detail_bloc.dart';
import 'package:tvserials/presentation/bloc/tv_now_playing/tv_now_playing_bloc.dart';
import 'package:tvserials/presentation/bloc/tv_recommendation/tv_recommendation_bloc.dart';
import 'package:tvserials/presentation/bloc/watchlist_tv/watchlist_tv_bloc.dart';
import 'package:tvserials/presentation/pages/tv/home_tv_page.dart';
import 'package:tvserials/presentation/pages/tv/popular_tv_page.dart';
import 'package:tvserials/presentation/pages/tv/top_rated_tv_page.dart';
import 'package:tvserials/presentation/pages/tv/tv_detail_page.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //Movies Serial Bloc
        BlocProvider(
          create: (_) => di.locator<SearchMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieNowPlayingBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieWatchListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieRecommendationBloc>(),
        ),
        //Tv Serial Bloc
        BlocProvider(
          create: (_) => di.locator<SearchTvSerialsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvNowPlayingBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvWatchListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvRecommendationBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HOME_MOVIE_ROUTE:
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case POPULAR_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TOP_RATED_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MOVIE_DETAIL_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SEARCH_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => SearchMoviePage());
            //tv
            case HOME_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => HomeTvPage());
            case POPULAR_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularTvPage());
            case TOP_RATED_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => TopRatedTvPage());
            case TV_DETAIL_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case SEARCH_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => SearchTvPage());
            case WATCHLIST_ROUTE:
              return MaterialPageRoute(builder: (_) => WatchlistPage());
            case ABOUT_ROUTE:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
