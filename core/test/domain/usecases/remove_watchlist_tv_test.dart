import 'package:dartz/dartz.dart';
import 'package:core/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects_tv.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlistTvSerial usecase;
  late MockTvSerialRepository mockTvSerialRepository;

  setUp(() {
    mockTvSerialRepository = MockTvSerialRepository();
    usecase = RemoveWatchlistTvSerial(mockTvSerialRepository);
  });

  test('should remove watchlist Tv from repository', () async {
    // arrange
    when(mockTvSerialRepository.removeWatchlistTvSerial(testTvSerialDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(testTvSerialDetail);
    // assert
    verify(mockTvSerialRepository.removeWatchlistTvSerial(testTvSerialDetail));
    expect(result, Right('Removed from watchlist'));
  });
}
