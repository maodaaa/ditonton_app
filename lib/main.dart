import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
import 'package:movies/presentation/provider/movie/movie_detail_notifier.dart';
import 'package:movies/presentation/provider/movie/movie_list_notifier.dart';
import 'package:movies/presentation/provider/movie/popular_movies_notifier.dart';
import 'package:movies/presentation/provider/movie/top_rated_movies_notifier.dart';
import 'package:movies/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:tvserials/presentation/pages/tv/home_tv_page.dart';
import 'package:tvserials/presentation/pages/tv/popular_tv_page.dart';
import 'package:tvserials/presentation/pages/tv/top_rated_tv_page.dart';
import 'package:tvserials/presentation/pages/tv/tv_detail_page.dart';
import 'package:tvserials/presentation/provider/tv/popular_tv_notifier.dart';
import 'package:tvserials/presentation/provider/tv/top_rated_tv_notifier.dart';
import 'package:tvserials/presentation/provider/tv/tv_detail_notifier.dart';
import 'package:tvserials/presentation/provider/tv/tv_list_notifier.dart';
import 'package:tvserials/presentation/provider/tv/watchlist_tv_notifier.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchMoviesBloc>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
        // Tv
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSerialListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSerialDetailNotifier>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchTvSerialsBloc>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedTvSerialsNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularTvSerialsNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistTvNotifier>(),
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
