import 'package:core/utils/exception.dart';
import 'package:core/data/datasources/tv/tv_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects_tv.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvSerialLocalDataSourceImpl dataSource;
  late MockDatabaseHelperTvSerial mockDatabaseHelperTvSerial;

  setUp(() {
    mockDatabaseHelperTvSerial = MockDatabaseHelperTvSerial();
    dataSource = TvSerialLocalDataSourceImpl(
        databaseHelperTvSerial: mockDatabaseHelperTvSerial);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelperTvSerial
              .insertWatchlistTvSerial(testTvSerialTable))
          .thenAnswer((_) async => 1);
      // act
      final result =
          await dataSource.insertWatchlistTvSerial(testTvSerialTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelperTvSerial
              .insertWatchlistTvSerial(testTvSerialTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlistTvSerial(testTvSerialTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelperTvSerial
              .removeWatchlistTvSerial(testTvSerialTable))
          .thenAnswer((_) async => 1);
      // act
      final result =
          await dataSource.removeWatchlistTvSerial(testTvSerialTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelperTvSerial
              .removeWatchlistTvSerial(testTvSerialTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlistTvSerial(testTvSerialTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get TvSerial Detail By Id', () {
    final tId = 1;

    test('should return Tv Serial Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelperTvSerial.getTvSerialById(tId))
          .thenAnswer((_) async => testTvSerialMap);
      // act
      final result = await dataSource.getTvSerialById(tId);
      // assert
      expect(result, testTvSerialTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelperTvSerial.getTvSerialById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvSerialById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist Tv Serial', () {
    test('should return list of MovieTable from database', () async {
      // arrange
      when(mockDatabaseHelperTvSerial.getWatchlistTvSerials())
          .thenAnswer((_) async => [testTvSerialMap]);
      // act
      final result = await dataSource.getWatchlistTvSerials();
      // assert
      expect(result, [testTvSerialTable]);
    });
  });
}
