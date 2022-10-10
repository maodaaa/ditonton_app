import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:movies/domain/usecases/movie/get_watchlist_status.dart';
import 'package:movies/domain/usecases/movie/remove_watchlist.dart';
import 'package:movies/domain/usecases/movie/save_watchlist.dart';
import 'package:movies/presentation/bloc/watchlist_movie/watchlist_movie_bloc.dart';
import '../../../dummy_data/dummy_objects_movie.dart';
import 'watchlist_movie_bloc_test.mocks.dart';

@GenerateMocks(
  [SaveWatchlist, RemoveWatchlist, GetWatchlistMovies, GetWatchListStatus],
)
void main() {
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late MockSaveWatchlist mockSaveWatchlist;
  late MovieWatchListBloc movieWatchListBloc;

  setUp(() {
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    movieWatchListBloc = MovieWatchListBloc(
      mockGetWatchListStatus,
      mockGetWatchlistMovies,
      mockSaveWatchlist,
      mockRemoveWatchlist,
    );
  });

  group('get watchlist status', () {
    blocTest<MovieWatchListBloc, MovieWatchListState>(
      'check status movie when true',
      build: () {
        when(mockGetWatchListStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => true);
        return movieWatchListBloc;
      },
      act: (bloc) => bloc.add(OnGetMovieWatchListStatus(testMovieDetail.id)),
      expect: () => [const MovieWatchListStatus(true)],
      verify: (bloc) {
        verify(mockGetWatchListStatus.execute(testMovieDetail.id));
        return OnGetMovieWatchListStatus(testMovieDetail.id);
      },
    );

    blocTest<MovieWatchListBloc, MovieWatchListState>(
        'check status movie when false ',
        build: () {
          when(mockGetWatchListStatus.execute(testMovieDetail.id))
              .thenAnswer((_) async => false);
          return movieWatchListBloc;
        },
        act: (bloc) => bloc.add(OnGetMovieWatchListStatus(testMovieDetail.id)),
        expect: () => [
              const MovieWatchListStatus(false),
            ],
        verify: (bloc) {
          verify(mockGetWatchListStatus.execute(testMovieDetail.id));
          return OnGetMovieWatchListStatus(testMovieDetail.id);
        });
  });

  group('get watchlist movies', () {
    blocTest<MovieWatchListBloc, MovieWatchListState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Right([testWatchlistMovie]));
        return movieWatchListBloc;
      },
      act: (bloc) => bloc.add(OnMovieWatchListCalled()),
      expect: () => [
        MovieWatchListLoading(),
        MovieWatchListHasData([testWatchlistMovie]),
      ],
      verify: (bloc) {
        verify(mockGetWatchlistMovies.execute());
        return OnMovieWatchListCalled();
      },
    );

    blocTest<MovieWatchListBloc, MovieWatchListState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockGetWatchlistMovies.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return movieWatchListBloc;
      },
      act: (bloc) => bloc.add(OnMovieWatchListCalled()),
      expect: () => [
        MovieWatchListLoading(),
        const MovieWatchListError('Server Failure'),
      ],
      verify: (bloc) => MovieWatchListLoading(),
    );
  });

  group('add movie to watchlist', () {
    blocTest<MovieWatchListBloc, MovieWatchListState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSaveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist'));
        when(mockGetWatchListStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => true);
        return movieWatchListBloc;
      },
      act: (bloc) => bloc.add(OnAddMovieCalled(testMovieDetail)),
      expect: () => [
        const MovieWatchListMassage('Added to Watchlist'),
        const MovieWatchListStatus(true),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlist.execute(testMovieDetail));
        verify(mockGetWatchListStatus.execute(testMovieDetail.id));
        return OnAddMovieCalled(testMovieDetail);
      },
    );

    blocTest<MovieWatchListBloc, MovieWatchListState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockSaveWatchlist.execute(testMovieDetail)).thenAnswer((_) async =>
            const Left(DatabaseFailure('failed add movie to watchlist')));
        when(mockGetWatchListStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);
        return movieWatchListBloc;
      },
      act: (bloc) => bloc.add(OnAddMovieCalled(testMovieDetail)),
      expect: () => [
        const MovieWatchListError('failed add movie to watchlist'),
        const MovieWatchListStatus(false),
      ],
      verify: (bloc) {
        verify(mockSaveWatchlist.execute(testMovieDetail));
        verify(mockGetWatchListStatus.execute(testMovieDetail.id));
        return OnAddMovieCalled(testMovieDetail);
      },
    );
  });

  group('remove watchlist', () {
    blocTest<MovieWatchListBloc, MovieWatchListState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockRemoveWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Removed from Watchlist'));
        when(mockGetWatchListStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);
        return movieWatchListBloc;
      },
      act: (bloc) => bloc.add(OnRemoveMovieCalled(testMovieDetail)),
      expect: () => [
        const MovieWatchListMassage('Removed from Watchlist'),
        const MovieWatchListStatus(false),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlist.execute(testMovieDetail));
        return OnRemoveMovieCalled(testMovieDetail);
      },
    );

    blocTest<MovieWatchListBloc, MovieWatchListState>(
      'Should emit [Loading, Error] when get data is unsuccessful',
      build: () {
        when(mockRemoveWatchlist.execute(testMovieDetail)).thenAnswer(
            (_) async =>
                const Left(DatabaseFailure('failed add data to watchlist')));
        when(mockGetWatchListStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);
        return movieWatchListBloc;
      },
      act: (bloc) => bloc.add(OnRemoveMovieCalled(testMovieDetail)),
      expect: () => [
        const MovieWatchListError('failed add data to watchlist'),
        const MovieWatchListStatus(false),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlist.execute(testMovieDetail));
        return OnRemoveMovieCalled(testMovieDetail);
      },
    );
  });
  test('the Movie initial state should be empty ', () {
    expect(movieWatchListBloc.state, MovieWatchListEmpty());
  });
}
