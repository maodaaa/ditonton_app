import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:core/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:core/presentation/provider/tv/watchlist_tv_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects_tv.dart';
import 'watchlist_tv_notifier_test.mocks.dart';

@GenerateMocks([GetWatchlistTvSerial])
void main() {
  late WatchlistTvNotifier provider;
  late MockGetWatchlistTvSerial mockGetWatchlistTvSerial;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistTvSerial = MockGetWatchlistTvSerial();
    provider = WatchlistTvNotifier(
      getWatchlistTvSerial: mockGetWatchlistTvSerial,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  test('should change tv data when data is gotten successfully', () async {
    // arrange
    when(mockGetWatchlistTvSerial.execute())
        .thenAnswer((_) async => Right([testWatchlistTvSerial]));
    // act
    await provider.fetchWatchlistTvSerial();
    // assert
    expect(provider.watchlistState, RequestState.Loaded);
    expect(provider.watchlistTvSerials, [testWatchlistTvSerial]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetWatchlistTvSerial.execute())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    // act
    await provider.fetchWatchlistTvSerial();
    // assert
    expect(provider.watchlistState, RequestState.Error);
    expect(provider.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}
