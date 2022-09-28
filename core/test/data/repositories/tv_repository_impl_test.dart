import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:core/data/models/genre_model.dart';
import 'package:core/data/models/tv/seasons_model.dart';
import 'package:core/data/models/tv/tv_detail_model.dart';
import 'package:core/data/models/tv/tv_model.dart';
import 'package:core/utils/exception.dart';
import 'package:core/utils/failure.dart';
import 'package:core/data/repositories/tv_repository_impl.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects_tv.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvSerialRepositoryImpl repository;
  late MockTvSerialRemoteDataSource mockRemoteDataSource;
  late MockTvSerialLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockTvSerialRemoteDataSource();
    mockLocalDataSource = MockTvSerialLocalDataSource();
    repository = TvSerialRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  const tSerialModel = TvSerialModel(
      posterPath: "/vC324sdfcS313vh9QXwijLIHPJp.jpg",
      popularity: 47.432451,
      id: 1,
      backdropPath: "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg",
      voteAverage: 5.04,
      overview:
          "Based on the Pretty Little Liars series of young adult novels by Sara Shepard.",
      firstAirDate: "2010-06-08",
      genreIds: [1],
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
          "Based on the Pretty Little Liars series of young adult novels by Sara Shepard.",
      firstAirDate: "2010-06-08",
      genreIds: const [1],
      voteCount: 133,
      name: "Pretty Little Liars",
      originalName: "Pretty Little Liars");

  final tTvSerialModelList = <TvSerialModel>[tSerialModel];
  final tTvSerialList = <TvSerial>[tTvSerial];

  group('Now Playing Tv Serial', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTvSerials())
          .thenAnswer((_) async => tTvSerialModelList);
      // act
      final result = await repository.getNowPlayingTvSerials();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTvSerials());
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSerialList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTvSerials())
          .thenThrow(ServerException());
      // act
      final result = await repository.getNowPlayingTvSerials();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTvSerials());
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTvSerials())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getNowPlayingTvSerials();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTvSerials());
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Popular Tv Serial', () {
    test('should return Tv Serial list when call to data source is success',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSerials())
          .thenAnswer((_) async => tTvSerialModelList);
      // act
      final result = await repository.getPopularTvSerials();
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSerialList);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSerials())
          .thenThrow(ServerException());
      // act
      final result = await repository.getPopularTvSerials();
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvSerials())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getPopularTvSerials();
      // assert
      expect(result,
          const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Top Rated Tv Serial', () {
    test('should return Tv Serial list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvSerials())
          .thenAnswer((_) async => tTvSerialModelList);
      // act
      final result = await repository.getTopRatedTvSerials();
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSerialList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvSerials())
          .thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTvSerials();
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvSerials())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTopRatedTvSerials();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Tv Serial Detail', () {
    final tId = 1;
    final tTvSerialResponse = TvSerialDetailResponse(
      backdropPath: 'backdropPath',
      episodeRunTime: [1],
      genres: [GenreModel(id: 1, name: 'Action')],
      homepage: "http://www.hbo.com/game-of-thrones",
      id: 1,
      originalName: 'originalName',
      overview: 'overview',
      posterPath: 'posterPath',
      seasons: [
        SeasonModel(
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

    test(
        'should return Movie data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSerialDetail(tId))
          .thenAnswer((_) async => tTvSerialResponse);
      // act
      final result = await repository.getTvSerialDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTvSerialDetail(tId));
      expect(result, equals(Right(testTvSerialDetail)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSerialDetail(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTvSerialDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTvSerialDetail(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSerialDetail(tId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvSerialDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTvSerialDetail(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get Tv Serial Recommendations', () {
    final tTvSerialList = <TvSerialModel>[];
    final tId = 1;

    test('should return data (Tv Serial list) when the call is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSerialRecommendations(tId))
          .thenAnswer((_) async => tTvSerialList);
      // act
      final result = await repository.getTvSerialRecommendations(tId);
      // assert
      verify(mockRemoteDataSource.getTvSerialRecommendations(tId));
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTvSerialList));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSerialRecommendations(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTvSerialRecommendations(tId);
      // assertbuild runner
      verify(mockRemoteDataSource.getTvSerialRecommendations(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTvSerialRecommendations(tId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvSerialRecommendations(tId);
      // assert
      verify(mockRemoteDataSource.getTvSerialRecommendations(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Seach tv Serial', () {
    final tQuery = 'game of thrones';

    test('should return Tv Serial list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvSerials(tQuery))
          .thenAnswer((_) async => tTvSerialModelList);
      // act
      final result = await repository.searchTvSerials(tQuery);
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSerialList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvSerials(tQuery))
          .thenThrow(ServerException());
      // act
      final result = await repository.searchTvSerials(tQuery);
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvSerials(tQuery))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchTvSerials(tQuery);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlistTvSerial(testTvSerialTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlistTvSerial(testTvSerialDetail);
      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlistTvSerial(testTvSerialTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlistTvSerial(testTvSerialDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlistTvSerial(testTvSerialTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result =
          await repository.removeWatchlistTvSerial(testTvSerialDetail);
      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlistTvSerial(testTvSerialTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result =
          await repository.removeWatchlistTvSerial(testTvSerialDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;
      when(mockLocalDataSource.getTvSerialById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlistTvSerial(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;
      when(mockLocalDataSource.getTvSerialById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlistTvSerial(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist Tv Serials', () {
    test('should return list of Tv Serials', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistTvSerials())
          .thenAnswer((_) async => [testTvSerialTable]);
      // act
      final result = await repository.getWatchlistTvSerials();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTvSerial]);
    });
  });
}
