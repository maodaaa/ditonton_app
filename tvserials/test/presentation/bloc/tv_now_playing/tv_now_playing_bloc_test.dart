import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvserials/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:tvserials/presentation/bloc/tv_now_playing/tv_now_playing_bloc.dart';
import '../../../dummy_data/dummy_objects_tv.dart';
import 'tv_now_playing_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvSerials])
void main() {
  late TvNowPlayingBloc tvNowPlayingBloc;
  late MockGetNowPlayingTvSerials mockGetNowPlayingTvSerials;

  setUp(() {
    mockGetNowPlayingTvSerials = MockGetNowPlayingTvSerials();
    tvNowPlayingBloc = TvNowPlayingBloc(mockGetNowPlayingTvSerials);
  });
  group('Get Now Playing Tv Serials', () {
    blocTest<TvNowPlayingBloc, TvNowPlayingState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetNowPlayingTvSerials.execute())
            .thenAnswer((_) async => Right(testTvSerialList));
        return tvNowPlayingBloc;
      },
      act: (bloc) => bloc.add(OnNowPlayingTvCalled()),
      expect: () => [
        TvNowPlayingLoading(),
        TvNowPlayingHasData(testTvSerialList),
      ],
      verify: (bloc) {
        verify(mockGetNowPlayingTvSerials.execute());
      },
    );
    blocTest<TvNowPlayingBloc, TvNowPlayingState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetNowPlayingTvSerials.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return tvNowPlayingBloc;
      },
      act: (bloc) => bloc.add(OnNowPlayingTvCalled()),
      expect: () => [
        TvNowPlayingLoading(),
        const TvNowPlayingError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetNowPlayingTvSerials.execute());
      },
    );
    test('initial state should be empty', () {
      expect(tvNowPlayingBloc.state, TvNowPlayingEmpty());
    });
  });
}
