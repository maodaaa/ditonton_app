import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/presentation/bloc/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv_status.dart';
import 'package:tvserials/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:tvserials/domain/usecases/tv/save_watchlist_tv.dart';
import 'package:tvserials/presentation/bloc/watchlist_tv/watchlist_tv_bloc.dart';

import '../../../dummy_data/dummy_objects_tv.dart';
import 'watchlist_tv_bloc_test.mocks.dart';

@GenerateMocks(
  [
    SaveWatchlistTvSerial,
    RemoveWatchlistTvSerial,
    GetWatchlistTvSerial,
    GetWatchListTvSerialStatus
  ],
)
void main() {
  late MockGetWatchlistTvSerial mockGetWatchlistTvSerial;
  late MockGetWatchListTvSerialStatus mockGetWatchListTvSerialStatus;
  late MockRemoveWatchlistTvSerial mockRemoveWatchlistTvSerial;
  late MockSaveWatchlistTvSerial mockSaveWatchlistTvSerial;
  late TvWatchListBloc tvWatchListBloc;

  setUp(() {
    mockGetWatchListTvSerialStatus = MockGetWatchListTvSerialStatus();
    mockGetWatchlistTvSerial = MockGetWatchlistTvSerial();
    mockSaveWatchlistTvSerial = MockSaveWatchlistTvSerial();
    mockRemoveWatchlistTvSerial = MockRemoveWatchlistTvSerial();
    tvWatchListBloc = TvWatchListBloc(
      mockGetWatchListTvSerialStatus,
      mockGetWatchlistTvSerial,
      mockSaveWatchlistTvSerial,
      mockRemoveWatchlistTvSerial,
    );
  });

  group('get watchlist status', () {
    blocTest<TvWatchListBloc, TvWatchListState>(
      'check status tv when true',
      build: () {
        when(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id))
            .thenAnswer((_) async => true);
        return tvWatchListBloc;
      },
      act: (bloc) => bloc.add(OnGetTvWatchListStatus(testTvSerialDetail.id)),
      expect: () => [const TvWatchListStatus(true)],
      verify: (bloc) {
        verify(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id));
        return OnGetTvWatchListStatus(testTvSerialDetail.id);
      },
    );

    blocTest<TvWatchListBloc, TvWatchListState>(
        'check status movie when false ',
        build: () {
          when(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id))
              .thenAnswer((_) async => false);
          return tvWatchListBloc;
        },
        act: (bloc) => bloc.add(OnGetTvWatchListStatus(testTvSerialDetail.id)),
        expect: () => [
              const TvWatchListStatus(false),
            ],
        verify: (bloc) {
          verify(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id));
          return OnGetMovieWatchListStatus(testTvSerialDetail.id);
        });
  });

  group('get watchlist Tv', () {
    blocTest<TvWatchListBloc, TvWatchListState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistTvSerial.execute())
            .thenAnswer((_) async => Right([testWatchlistTvSerial]));
        return tvWatchListBloc;
      },
      act: (bloc) => bloc.add(OnTvWatchListCalled()),
      expect: () => [
        TvWatchListLoading(),
        TvWatchListHasData([testWatchlistTvSerial]),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistTvSerial.execute());
        return OnTvWatchListCalled();
      },
    );

    blocTest<TvWatchListBloc, TvWatchListState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockGetWatchlistTvSerial.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return tvWatchListBloc;
      },
      act: (bloc) => bloc.add(OnTvWatchListCalled()),
      expect: () => [
        TvWatchListLoading(),
        const TvWatchListError('Server Failure'),
      ],
      verify: (bloc) => MovieWatchListLoading(),
    );
  });

  group('add Tv to watchlist', () {
    blocTest<TvWatchListBloc, TvWatchListState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSaveWatchlistTvSerial.execute(testTvSerialDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        when(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id))
            .thenAnswer((_) async => true);
        return tvWatchListBloc;
      },
      act: (bloc) => bloc.add(OnAddTvCalled(testTvSerialDetail)),
      expect: () => [
        const TvWatchListMassage('Added to Watchlist'),
        const TvWatchListStatus(true),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlistTvSerial.execute(testTvSerialDetail));
        verify(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id));
        return OnAddTvCalled(testTvSerialDetail);
      },
    );

    blocTest<TvWatchListBloc, TvWatchListState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockSaveWatchlistTvSerial.execute(testTvSerialDetail)).thenAnswer(
            (_) async =>
                const Left(DatabaseFailure('failed add tv to watchlist')));
        when(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id))
            .thenAnswer((_) async => false);
        return tvWatchListBloc;
      },
      act: (bloc) => bloc.add(OnAddTvCalled(testTvSerialDetail)),
      expect: () => [
        const TvWatchListError('failed add tv to watchlist'),
        const TvWatchListStatus(false),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlistTvSerial.execute(testTvSerialDetail));
        verify(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id));
        return OnAddTvCalled(testTvSerialDetail);
      },
    );
  });

  group('remove watchlist', () {
    blocTest<TvWatchListBloc, TvWatchListState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockRemoveWatchlistTvSerial.execute(testTvSerialDetail))
            .thenAnswer((_) async => const Right('Removed from Watchlist'));
        when(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id))
            .thenAnswer((_) async => false);
        return tvWatchListBloc;
      },
      act: (bloc) => bloc.add(OnRemoveTvCalled(testTvSerialDetail)),
      expect: () => [
        const TvWatchListMassage('Removed from Watchlist'),
        const TvWatchListStatus(false),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlistTvSerial.execute(testTvSerialDetail));
        return OnRemoveTvCalled(testTvSerialDetail);
      },
    );

    blocTest<TvWatchListBloc, TvWatchListState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockRemoveWatchlistTvSerial.execute(testTvSerialDetail))
            .thenAnswer((_) async =>
                const Left(DatabaseFailure('failed add data to watchlist')));
        when(mockGetWatchListTvSerialStatus.execute(testTvSerialDetail.id))
            .thenAnswer((_) async => false);
        return tvWatchListBloc;
      },
      act: (bloc) => bloc.add(OnRemoveTvCalled(testTvSerialDetail)),
      expect: () => [
        const TvWatchListError('failed add data to watchlist'),
        const TvWatchListStatus(false),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlistTvSerial.execute(testTvSerialDetail));
        return OnRemoveTvCalled(testTvSerialDetail);
      },
    );
  });
  test('the Tv initial state should be empty ', () {
    expect(tvWatchListBloc.state, TvWatchListEmpty());
  });
}
