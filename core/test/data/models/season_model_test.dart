import 'package:core/data/models/tv/seasons_model.dart';
import 'package:core/domain/entities/tv/seasons.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tSeasonModel = SeasonModel(
    airDate: "2010-12-05",
    episodeCount: 64,
    id: 3627,
    name: "Specials",
    overview: "",
    posterPath: "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
    seasonNumber: 0,
  );

  final tSeason = Season(
    airDate: "2010-12-05",
    episodeCount: 64,
    id: 3627,
    name: "Specials",
    overview: "",
    posterPath: "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
    seasonNumber: 0,
  );

  test('should be a subclass of Season entity', () async {
    final result = tSeasonModel.toEntity();
    expect(result, tSeason);
  });
}
