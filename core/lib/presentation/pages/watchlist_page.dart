import 'package:core/styles/colors.dart';
import 'package:core/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/bloc/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:tvserials/presentation/bloc/watchlist_tv/watchlist_tv_bloc.dart';
import 'package:movies/presentation/widgets/movie_card_list.dart';
import 'package:tvserials/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<WatchListTvBloc>(context, listen: false)
          .add(OnTvWatchListCalled());
      BlocProvider.of<WatchListMovieBloc>(context, listen: false)
          .add(OnMovieWatchListCalled());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    BlocProvider.of<WatchListTvBloc>(context, listen: false)
        .add(OnTvWatchListCalled());
    BlocProvider.of<WatchListMovieBloc>(context, listen: false)
        .add(OnMovieWatchListCalled());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
          bottom: const TabBar(
            indicatorColor: kMikadoYellow,
            tabs: [
              Tab(
                height: 60,
                text: 'Movies',
                icon: Icon(Icons.movie_creation_rounded),
              ),
              Tab(
                height: 60,
                text: 'Tv',
                icon: Icon(Icons.tv),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            movieWatchlist(),
            tvSerialWatchlist(),
          ],
        ),
      ),
    );
  }

  Widget movieWatchlist() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchListMovieBloc, MovieWatchListState>(
          builder: (context, state) {
            if (state is MovieWatchListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieWatchListHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.result[index];
                  return MovieCard(movie);
                },
                itemCount: state.result.length,
              );
            } else if (state is MovieWatchListError) {
              return Center(
                  key: const Key('error_message'), child: Text(state.message));
            } else {
              return const Center(
                child: Text("failed to load"),
              );
            }
          },
        ),
      ),
    );
  }

  Widget tvSerialWatchlist() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchListTvBloc, TvWatchListState>(
          builder: (context, state) {
            if (state is TvWatchListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvWatchListHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSerial = state.result[index];
                  return TvCard(tvSerial);
                },
                itemCount: state.result.length,
              );
            } else if (state is TvWatchListError) {
              return Center(
                  key: const Key('error_message'), child: Text(state.message));
            } else {
              return const Center(
                child: Text("failed to load"),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
