import 'package:tvserials/domain/usecases/tv/get_watchlist_tv_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchListTvSerialStatus usecase;
  late MockTvSerialRepository mockTvSerialRepository;

  setUp(() {
    mockTvSerialRepository = MockTvSerialRepository();
    usecase = GetWatchListTvSerialStatus(mockTvSerialRepository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(mockTvSerialRepository.isAddedToWatchlistTvSerial(1))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1);
    // assert
    expect(result, true);
  });
}
