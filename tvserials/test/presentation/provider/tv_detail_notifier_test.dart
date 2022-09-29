import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_detail.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv_status.dart';
import 'package:tvserials/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:tvserials/domain/usecases/tv/save_watchlist_tv.dart';
import 'package:core/utils/state_enum.dart';
import 'package:tvserials/presentation/provider/tv/tv_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects_tv.dart';
import 'tv_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetTvSerialDetail,
  GetTvSerialRecommendations,
  GetWatchListTvSerialStatus,
  SaveWatchlistTvSerial,
  RemoveWatchlistTvSerial,
])
void main() {
  late TvSerialDetailNotifier provider;
  late MockGetTvSerialDetail mockGetTvSerialDetail;
  late MockGetTvSerialRecommendations mockGetTvSerialRecommendations;
  late MockGetWatchListTvSerialStatus mockGetWatchListTvSerialStatus;
  late MockSaveWatchlistTvSerial mockSaveWatchlistTvSerial;
  late MockRemoveWatchlistTvSerial mockRemoveWatchlistTvSerial;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTvSerialDetail = MockGetTvSerialDetail();
    mockGetTvSerialRecommendations = MockGetTvSerialRecommendations();
    mockGetWatchListTvSerialStatus = MockGetWatchListTvSerialStatus();
    mockSaveWatchlistTvSerial = MockSaveWatchlistTvSerial();
    mockRemoveWatchlistTvSerial = MockRemoveWatchlistTvSerial();
    provider = TvSerialDetailNotifier(
      getTvSerialDetail: mockGetTvSerialDetail,
      getTvSerialRecommendations: mockGetTvSerialRecommendations,
      getWatchListTvSerialStatus: mockGetWatchListTvSerialStatus,
      saveWatchlistTvSerial: mockSaveWatchlistTvSerial,
      removeWatchlistTvSerial: mockRemoveWatchlistTvSerial,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tId = 1;

  final tTvSerial = TvSerial(
      backdropPath: "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg",
      firstAirDate: "2010-06-08",
      genreIds: [1],
      id: 1,
      name: "Pretty Little Liars",
      originalName: "Pretty Little Liars",
      overview:
          "Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.",
      popularity: 47.432451,
      posterPath: "/vC324sdfcS313vh9QXwijLIHPJp.jpg",
      voteAverage: 5.04,
      voteCount: 133);

  final tTvSerials = <TvSerial>[tTvSerial];

  void _arrangeUsecase() {
    when(mockGetTvSerialDetail.execute(tId))
        .thenAnswer((_) async => Right(testTvSerialDetail));
    when(mockGetTvSerialRecommendations.execute(tId))
        .thenAnswer((_) async => Right(tTvSerials));
  }

  group('Get Tv Detail Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTvSerialDetail(tId);
      // assert
      verify(mockGetTvSerialDetail.execute(tId));
      verify(mockGetTvSerialRecommendations.execute(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();
      // act
      provider.fetchTvSerialDetail(tId);
      // assert
      expect(provider.tvState, RequestState.Loading);
      expect(listenerCallCount, 1);
    });

    test('should change tv when data is gotten successfully', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTvSerialDetail(tId);
      // assert
      expect(provider.tvState, RequestState.Loaded);
      expect(provider.tvSerial, testTvSerialDetail);
      expect(listenerCallCount, 3);
    });

    test('should change recommendation tv when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTvSerialDetail(tId);
      // assert
      expect(provider.tvState, RequestState.Loaded);
      expect(provider.tvSerialRecommendations, tTvSerials);
    });
  });

  group('Get tv Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTvSerialDetail(tId);
      // assert
      verify(mockGetTvSerialRecommendations.execute(tId));
      expect(provider.tvSerialRecommendations, tTvSerials);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTvSerialDetail(tId);
      // assert
      expect(provider.recommendationState, RequestState.Loaded);
      expect(provider.tvSerialRecommendations, tTvSerials);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockGetTvSerialDetail.execute(tId))
          .thenAnswer((_) async => Right(testTvSerialDetail));
      when(mockGetTvSerialRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));
      // act
      await provider.fetchTvSerialDetail(tId);
      // assert
      expect(provider.recommendationState, RequestState.Error);
      expect(provider.message, 'Failed');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockGetWatchListTvSerialStatus.execute(1))
          .thenAnswer((_) async => true);
      // act
      await provider.loadWatchlistStatus(1);
      // assert
      expect(provider.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveWatchlistTvSerial.execute(testTvSerialDetail))
          .thenAnswer((_) async => Right('Success'));
      when(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id))
          .thenAnswer((_) async => true);
      // act
      await provider.addWatchlist(testTvSerialDetail);
      // assert
      verify(mockSaveWatchlistTvSerial.execute(testTvSerialDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlistTvSerial.execute(testTvSerialDetail))
          .thenAnswer((_) async => Right('Removed'));
      when(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id))
          .thenAnswer((_) async => false);
      // act
      await provider.removeFromWatchlist(testTvSerialDetail);
      // assert
      verify(mockRemoveWatchlistTvSerial.execute(testTvSerialDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveWatchlistTvSerial.execute(testTvSerialDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      when(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id))
          .thenAnswer((_) async => true);
      // act
      await provider.addWatchlist(testTvSerialDetail);
      // assert
      verify(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id));
      expect(provider.isAddedToWatchlist, true);
      expect(provider.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveWatchlistTvSerial.execute(testTvSerialDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id))
          .thenAnswer((_) async => false);
      // act
      await provider.addWatchlist(testTvSerialDetail);
      // assert
      expect(provider.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvSerialDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTvSerialRecommendations.execute(tId))
          .thenAnswer((_) async => Right(tTvSerials));
      // act
      await provider.fetchTvSerialDetail(tId);
      // assert
      expect(provider.tvState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
