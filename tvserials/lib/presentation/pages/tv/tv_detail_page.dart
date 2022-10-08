import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvserials/domain/entities/tv/tv_detail.dart';
import 'package:tvserials/presentation/bloc/tv_detail/tv_detail_bloc.dart';
import 'package:tvserials/presentation/bloc/tv_recommendation/tv_recommendation_bloc.dart';
import 'package:tvserials/presentation/bloc/watchlist_tv/watchlist_tv_bloc.dart';
import 'package:core/utils/routes.dart';
import 'package:tvserials/presentation/widgets/season_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvDetailPage extends StatefulWidget {
  final int id;
  const TvDetailPage({super.key, required this.id});

  @override
  _TvDetailPageState createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<TvDetailBloc>(context, listen: false)
          .add(OnTvDetailCalled(widget.id));
      BlocProvider.of<TvRecommendationBloc>(context, listen: false)
          .add(OnTvRecommendationCalled(widget.id));
      BlocProvider.of<TvWatchListBloc>(context, listen: false)
          .add(OnGetTvWatchListStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvDetailBloc, TvDetailState>(
        builder: (context, state) {
          if (state is TvDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvDetailHasData) {
            final tvSerial = state.result;
            return SafeArea(
              child: DetailContent(
                tvSerial,
              ),
            );
          } else if (state is TvDetailError) {
            return Center(
                key: const Key('error_message'), child: Text(state.message));
          } else {
            return const Center(
              child: Text("failed to load"),
            );
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final TvSerialDetail tvSerial;

  const DetailContent(this.tvSerial, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${tvSerial.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tvSerial.name,
                              style: kHeading5,
                            ),
                            BlocConsumer<TvWatchListBloc, TvWatchListState>(
                              listenWhen: (previous, current) {
                                if (previous is TvWatchListMassage !=
                                    current is TvWatchListMassage) {
                                  return true;
                                } else {
                                  return false;
                                }
                              },
                              listener: (context, state) {
                                if (state is TvWatchListStatus) {
                                  final isAddedToWatchList =
                                      state.isAddedToWatchlist;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 1),
                                      backgroundColor: kMikadoYellow,
                                      content: isAddedToWatchList
                                          ? const Text('Added to Watchlist')
                                          : const Text(
                                              ' Removed From Watchlist'),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is TvWatchListStatus) {
                                  final isAddedToWatchList =
                                      state.isAddedToWatchlist;
                                  return ElevatedBtn(
                                      isAddedToWatchList, tvSerial);
                                }
                                return Container();
                              },
                            ),
                            Text(
                              _showGenres(tvSerial.genres),
                            ),
                            Text(
                              _showDuration(tvSerial.episodeRunTime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tvSerial.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tvSerial.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tvSerial.overview,
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 120,
                              child: ListView.builder(
                                  itemCount: tvSerial.seasons.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final tvSeason = tvSerial.seasons[index];
                                    return SeasonCard(tvSeason);
                                  }),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<TvRecommendationBloc,
                                TvRecommendationState>(
                              builder: (context, state) {
                                if (state is TvRecommendationLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is TvRecommendationError) {
                                  return Text(state.message);
                                } else if (state is TvRecommendationHasData) {
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final tvSerial = state.result[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                TV_DETAIL_ROUTE,
                                                arguments: tvSerial.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${tvSerial.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: state.result.length,
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(List<dynamic> runtimes) {
    int result = 0;
    for (var runtime in runtimes) {
      result = runtime;
    }
    final int hours = result ~/ 60;
    final int minutes = result % 60;
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else if (minutes > 0) {
      return '${minutes}m';
    } else {
      return tvSerial.status;
    }
  }
}

class ElevatedBtn extends StatelessWidget {
  final TvSerialDetail tvSerial;
  final bool isAddedToWatchList;

  const ElevatedBtn(this.isAddedToWatchList, this.tvSerial, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (!isAddedToWatchList) {
          context.read<TvWatchListBloc>().add(OnAddTvCalled(tvSerial));
        } else {
          context.read<TvWatchListBloc>().add(OnRemoveTvCalled(tvSerial));
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isAddedToWatchList ? const Icon(Icons.check) : const Icon(Icons.add),
          const Text('Watchlist'),
        ],
      ),
    );
  }
}
