import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvserials/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:tvserials/presentation/bloc/top_rated_tv/top_rated_tv_bloc.dart';
import '../../../dummy_data/dummy_objects_tv.dart';
import 'top_rated_tv_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedTvSerials])
void main() {
  late TopRatedTvBloc topRatedTvBloc;
  late MockGetTopRatedTvSerials mockGetTopRatedTvSerials;

  setUp(() {
    mockGetTopRatedTvSerials = MockGetTopRatedTvSerials();
    topRatedTvBloc = TopRatedTvBloc(mockGetTopRatedTvSerials);
  });
  group('Get Top Rated Tv Serials', () {
    blocTest<TopRatedTvBloc, TopRatedTvState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTvSerials.execute())
            .thenAnswer((_) async => Right(testTvSerialList));
        return topRatedTvBloc;
      },
      act: (bloc) => bloc.add(OnTopRatedTvCalled()),
      expect: () => [
        TopRatedTvLoading(),
        TopRatedTvHasData(testTvSerialList),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTvSerials.execute());
      },
    );
    blocTest<TopRatedTvBloc, TopRatedTvState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTopRatedTvSerials.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return topRatedTvBloc;
      },
      act: (bloc) => bloc.add(OnTopRatedTvCalled()),
      expect: () => [
        TopRatedTvLoading(),
        const TopRatedTvError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTvSerials.execute());
      },
    );
    test('initial state should be empty', () {
      expect(topRatedTvBloc.state, TopRatedTvEmpty());
    });
  });
}
