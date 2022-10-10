import 'package:core/data/models/movie/movie_model.dart';
import 'package:core/data/models/movie/movie_response.dart';
import 'package:movies/domain/entities/movie/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tMovieModel = MovieModel(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1.0,
    voteCount: 1,
  );

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1.0,
    voteCount: 1,
  );
  const tMovieResponseModel =
      MovieResponse(movieList: <MovieModel>[tMovieModel]);
  test('should be a subclass of Movie entity', () async {
    final result = tMovieModel.toEntity();
    expect(result, tMovie);
  });

  test('should return a JSON map containing proper data', () async {
    // arrange

    // act
    final result = tMovieResponseModel.toJson();
    // assert
    final expectedJsonMap = {
      "results": [
        {
          "adult": false,
          "backdrop_path": "backdropPath",
          "genre_ids": [1, 2, 3],
          "id": 1,
          "original_title": "originalTitle",
          "overview": "overview",
          "popularity": 1.0,
          "poster_path": "posterPath",
          "release_date": "releaseDate",
          "title": "title",
          "video": false,
          "vote_average": 1.0,
          "vote_count": 1
        }
      ],
    };
    expect(result, expectedJsonMap);
  });
}
