import 'package:dartz/dartz.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects_tv.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvSerial usecase;
  late MockTvSerialRepository mockTvSerialRepository;

  setUp(() {
    mockTvSerialRepository = MockTvSerialRepository();
    usecase = GetWatchlistTvSerial(mockTvSerialRepository);
  });

  test('should get list of Tv from the repository', () async {
    // arrange
    when(mockTvSerialRepository.getWatchlistTvSerials())
        .thenAnswer((_) async => Right(testTvSerialList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testTvSerialList));
  });
}
