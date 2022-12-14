import 'package:core/data/models/tv/tv_model.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvSerialModel = TvSerialModel(
      posterPath: "/vC324sdfcS313vh9QXwijLIHPJp.jpg",
      popularity: 47.432451,
      id: 1,
      backdropPath: "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg",
      voteAverage: 5.04,
      overview:
          "Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.",
      firstAirDate: "2010-06-08",
      genreIds: [18, 9648],
      voteCount: 133,
      name: "Pretty Little Liars",
      originalName: "Pretty Little Liars");

  final tTvSerial = TvSerial(
      posterPath: "/vC324sdfcS313vh9QXwijLIHPJp.jpg",
      popularity: 47.432451,
      id: 1,
      backdropPath: "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg",
      voteAverage: 5.04,
      overview:
          "Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.",
      firstAirDate: "2010-06-08",
      genreIds: [18, 9648],
      voteCount: 133,
      name: "Pretty Little Liars",
      originalName: "Pretty Little Liars");

  test('should be a subclass of TvSerial entity', () async {
    final result = tTvSerialModel.toEntity();
    expect(result, tTvSerial);
  });
}
