import 'package:equatable/equatable.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/entities/tv/tv_detail.dart';

class TvSerialTable extends Equatable {
  final int id;
  final String? name;
  final String? posterPath;
  final String? overview;

  const TvSerialTable({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.overview,
  });

  factory TvSerialTable.fromEntity(TvSerialDetail tv) => TvSerialTable(
        id: tv.id,
        name: tv.name,
        posterPath: tv.posterPath,
        overview: tv.overview,
      );

  factory TvSerialTable.fromMap(Map<String, dynamic> map) => TvSerialTable(
        id: map['id'],
        name: map['name'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'posterPath': posterPath,
        'overview': overview,
      };

  TvSerial toEntity() => TvSerial.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: name,
      );

  @override
  List<Object?> get props => [id, name, posterPath, overview];
}
