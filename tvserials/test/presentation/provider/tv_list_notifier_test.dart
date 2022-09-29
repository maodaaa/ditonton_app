import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_popular_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:core/utils/state_enum.dart';
import 'package:tvserials/presentation/provider/tv/tv_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_list_notifier_test.mocks.dart';

@GenerateMocks(
    [GetNowPlayingTvSerials, GetPopularTvSerials, GetTopRatedTvSerials])
void main() {
  late TvSerialListNotifier provider;
  late MockGetNowPlayingTvSerials mockGetNowPlayingTvSerials;
  late MockGetPopularTvSerials mockGetPopularTvSerials;
  late MockGetTopRatedTvSerials mockGetTopRatedTvSerials;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetNowPlayingTvSerials = MockGetNowPlayingTvSerials();
    mockGetPopularTvSerials = MockGetPopularTvSerials();
    mockGetTopRatedTvSerials = MockGetTopRatedTvSerials();
    provider = TvSerialListNotifier(
      getNowPlayingTvSerials: mockGetNowPlayingTvSerials,
      getPopularTvSerials: mockGetPopularTvSerials,
      getTopRatedTvSerials: mockGetTopRatedTvSerials,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

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

  final tTvSerialList = <TvSerial>[tTvSerial];

  group('now playing tv', () {
    test('initialState should be Empty', () {
      expect(provider.nowPlayingState, equals(RequestState.Empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(mockGetNowPlayingTvSerials.execute())
          .thenAnswer((_) async => Right(tTvSerialList));
      // act
      provider.fetchNowPlayingTvSerials();
      // assert
      verify(mockGetNowPlayingTvSerials.execute());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(mockGetNowPlayingTvSerials.execute())
          .thenAnswer((_) async => Right(tTvSerialList));
      // act
      provider.fetchNowPlayingTvSerials();
      // assert
      expect(provider.nowPlayingState, RequestState.Loading);
    });

    test('should change tv when data is gotten successfully', () async {
      // arrange
      when(mockGetNowPlayingTvSerials.execute())
          .thenAnswer((_) async => Right(tTvSerialList));
      // act
      await provider.fetchNowPlayingTvSerials();
      // assert
      expect(provider.nowPlayingState, RequestState.Loaded);
      expect(provider.nowPlayingTvSerials, tTvSerialList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetNowPlayingTvSerials.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchNowPlayingTvSerials();
      // assert
      expect(provider.nowPlayingState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('popular tv', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetPopularTvSerials.execute())
          .thenAnswer((_) async => Right(tTvSerialList));
      // act
      provider.fetchPopularTvSerials();
      // assert
      expect(provider.popularTvSerialsState, RequestState.Loading);
      // verify(provider.setState(RequestState.Loading));
    });

    test('should change tv data when data is gotten successfully', () async {
      // arrange
      when(mockGetPopularTvSerials.execute())
          .thenAnswer((_) async => Right(tTvSerialList));
      // act
      await provider.fetchPopularTvSerials();
      // assert
      expect(provider.popularTvSerialsState, RequestState.Loaded);
      expect(provider.popularTvSerials, tTvSerialList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetPopularTvSerials.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchPopularTvSerials();
      // assert
      expect(provider.popularTvSerialsState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('top rated tv', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTopRatedTvSerials.execute())
          .thenAnswer((_) async => Right(tTvSerialList));
      // act
      provider.fetchTopRatedTvSerials();
      // assert
      expect(provider.topRatedTvSerialsState, RequestState.Loading);
    });

    test('should change tv data when data is gotten successfully', () async {
      // arrange
      when(mockGetTopRatedTvSerials.execute())
          .thenAnswer((_) async => Right(tTvSerialList));
      // act
      await provider.fetchTopRatedTvSerials();
      // assert
      expect(provider.topRatedTvSerialsState, RequestState.Loaded);
      expect(provider.topRatedTvSerials, tTvSerialList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTopRatedTvSerials.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTopRatedTvSerials();
      // assert
      expect(provider.topRatedTvSerialsState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
