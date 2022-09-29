import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:equatable/equatable.dart';

class TvSerialModel extends Equatable {
  const TvSerialModel({
    required this.posterPath,
    required this.popularity,
    required this.id,
    required this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.firstAirDate,
    required this.genreIds,
    required this.voteCount,
    required this.name,
    required this.originalName,
  });

  final String? posterPath;
  final double popularity;
  final int id;
  final String? backdropPath;
  final double voteAverage;
  final String overview;
  final String? firstAirDate;
  final List<int> genreIds;
  final int voteCount;
  final String name;
  final String originalName;

  factory TvSerialModel.fromJson(Map<String, dynamic> json) => TvSerialModel(
        posterPath: json["poster_path"],
        popularity: json["popularity"].toDouble(),
        id: json["id"],
        backdropPath: json["backdrop_path"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        firstAirDate: json["first_air_date"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "popularity": popularity,
        "id": id,
        "backdrop_path": backdropPath,
        "vote_average": voteAverage,
        "overview": overview,
        "first_air_date": firstAirDate,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
      };

  TvSerial toEntity() {
    return TvSerial(
        posterPath: this.posterPath,
        popularity: this.popularity,
        id: this.id,
        backdropPath: this.backdropPath,
        voteAverage: this.voteAverage,
        overview: this.overview,
        firstAirDate: this.firstAirDate,
        genreIds: this.genreIds,
        voteCount: this.voteCount,
        name: this.name,
        originalName: this.originalName);
  }

  @override
  List<Object?> get props => [
        posterPath,
        popularity,
        id,
        backdropPath,
        voteAverage,
        overview,
        firstAirDate,
        genreIds,
        voteCount,
        name,
        originalName
      ];
}
