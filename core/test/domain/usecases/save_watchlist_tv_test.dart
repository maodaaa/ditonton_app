import 'package:dartz/dartz.dart';
import 'package:core/domain/usecases/tv/save_watchlist_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects_tv.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistTvSerial usecase;
  late MockTvSerialRepository mockTvSerialRepository;

  setUp(() {
    mockTvSerialRepository = MockTvSerialRepository();
    usecase = SaveWatchlistTvSerial(mockTvSerialRepository);
  });

  test('should save tv to the repository', () async {
    // arrange
    when(mockTvSerialRepository.saveWatchlistTvSerial(testTvSerialDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTvSerialDetail);
    // assert
    verify(mockTvSerialRepository.saveWatchlistTvSerial(testTvSerialDetail));
    expect(result, Right('Added to Watchlist'));
  });
}
