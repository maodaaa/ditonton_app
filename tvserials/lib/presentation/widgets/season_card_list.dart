import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/utils/constants.dart';
import 'package:core/styles/colors.dart';
import 'package:tvserials/domain/entities/tv/seasons.dart';
import 'package:flutter/material.dart';

class SeasonCard extends StatelessWidget {
  final Season tvSeason;

  const SeasonCard(this.tvSeason, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth - 40,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: kGrey,
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: kDavysGrey,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: _isPosterPath(tvSeason.posterPath),
                  width: 70,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Season ${tvSeason.seasonNumber}',
                    ),
                    Text(
                      'Episode ${tvSeason.episodeCount}',
                      textAlign: TextAlign.end,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2),
                        child: Text(
                          tvSeason.overview,
                          style: const TextStyle(overflow: TextOverflow.fade),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _isPosterPath(posterPath) {
    if (posterPath != null) {
      return '$BASE_IMAGE_URL${tvSeason.posterPath}';
    } else {
      return 'https://via.placeholder.com/500';
    }
  }
}
