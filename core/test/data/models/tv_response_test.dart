import 'dart:convert';
import 'package:core/data/models/tv/tv_model.dart';
import 'package:core/data/models/tv/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../json_reader.dart';

void main() {
  final tTvSerialModel = TvSerialModel(
      backdropPath: "/pdfCr8W0wBCpdjbZXSxnKhZtosP.jpg",
      firstAirDate: "2022-09-01",
      genreIds: [10765, 10759, 18],
      id: 1,
      name: "The Lord of the Rings: The Rings of Power",
      originalName: "The Lord of the Rings: The Rings of Power",
      overview:
          "Beginning in a time of relative peace, we follow an ensemble cast of characters as they confront the re-emergence of evil to Middle-earth. From the darkest depths of the Misty Mountains, to the majestic forests of Lindon, to the breathtaking island kingdom of Númenor, to the furthest reaches of the map, these kingdoms and characters will carve out legacies that live on long after they are gone.",
      popularity: 5316.126,
      posterPath: "/suyNxglk17Cpk8rCM2kZgqKdftk.jpg",
      voteAverage: 7.6,
      voteCount: 778);
  final tTvSerialResponseModel =
      TvSerialResponse(tvSerialList: <TvSerialModel>[tTvSerialModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/now_playing_tv.json'));
      // act
      final result = TvSerialResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvSerialResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvSerialResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/pdfCr8W0wBCpdjbZXSxnKhZtosP.jpg",
            "first_air_date": "2022-09-01",
            "genre_ids": [10765, 10759, 18],
            "id": 1,
            "name": "The Lord of the Rings: The Rings of Power",
            "original_name": "The Lord of the Rings: The Rings of Power",
            "overview":
                "Beginning in a time of relative peace, we follow an ensemble cast of characters as they confront the re-emergence of evil to Middle-earth. From the darkest depths of the Misty Mountains, to the majestic forests of Lindon, to the breathtaking island kingdom of Númenor, to the furthest reaches of the map, these kingdoms and characters will carve out legacies that live on long after they are gone.",
            "popularity": 5316.126,
            "poster_path": "/suyNxglk17Cpk8rCM2kZgqKdftk.jpg",
            "vote_average": 7.6,
            "vote_count": 778
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
