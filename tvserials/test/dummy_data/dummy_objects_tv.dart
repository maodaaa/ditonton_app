import 'package:core/data/models/tv/tv_table.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:tvserials/domain/entities/tv/seasons.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/entities/tv/tv_detail.dart';

final testTvSerial = TvSerial(
    backdropPath: "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg",
    firstAirDate: "2010-06-08",
    genreIds: [1],
    id: 1,
    name: "Pretty Little Liars",
    originalName: "Pretty Little Liars",
    overview:
        "Based on the Pretty Little Liars series of young adult novels by Sara Shepard.",
    popularity: 47.432451,
    posterPath: "/vC324sdfcS313vh9QXwijLIHPJp.jpg",
    voteAverage: 5.04,
    voteCount: 133);

final testTvSerialList = [testTvSerial];

// final testTvSerialDetail = TvSerialDetail(
//   backdropPath: "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg",
//   episodeRunTime: [1],
//   firstAirDate: "2010-06-08",
//   genres: [
//     Genre(id: 1, name: "Sci-Fi & Fantasy"),
//   ],
//   homepage: "http://www.hbo.com/game-of-thrones",
//   id: 1,
//   name: "Pretty Little Liars",
//   numberOfSeasons: 8,
//   originalName: "Pretty Little Liars",
//   overview:
//       "Based on the Pretty Little Liars series of young adult novels by Sara Shepard.",
//   popularity: 47.432451,
//   posterPath: "/vC324sdfcS313vh9QXwijLIHPJp.jpg",
//   seasons: [
//     Season(
//       airDate: "2010-12-05",
//       episodeCount: 64,
//       id: 3627,
//       name: "Specials",
//       overview: "",
//       posterPath: "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
//       seasonNumber: 0,
//     )
//   ],
//   status: "Ended",
//   tagline: "Winter Is Coming",
//   type: "Scripted",
//   voteAverage: 5.04,
//   voteCount: 133,
// );

// final testTvSerialTable = TvSerialTable(
//   id: 1,
//   name: "Pretty Little Liars",
//   posterPath: "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg",
//   overview:
//       "Based on the Pretty Little Liars series of young adult novels by Sara Shepard.",
// );

final testTvSerialDetail = TvSerialDetail(
  backdropPath: 'backdropPath',
  episodeRunTime: [1],
  genres: [Genre(id: 1, name: 'Action')],
  homepage: "http://www.hbo.com/game-of-thrones",
  id: 1,
  originalName: 'originalName',
  overview: 'overview',
  posterPath: 'posterPath',
  seasons: [
    Season(
      airDate: "2010-12-05",
      episodeCount: 64,
      id: 3627,
      name: "Specials",
      overview: "",
      posterPath: "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
      seasonNumber: 0,
    )
  ],
  firstAirDate: 'firstAirDate',
  name: 'name',
  numberOfSeasons: 8,
  popularity: 47.432451,
  voteAverage: 1,
  voteCount: 1,
  status: "Ended",
  tagline: "Winter Is Coming",
  type: "Scripted",
);

final testTvSerialTable = TvSerialTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);
final testWatchlistTvSerial = TvSerial.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);
final testTvSerialMap = {
  'id': 1,
  'overview': "overview",
  'posterPath': "posterPath",
  'name': "name",
};
