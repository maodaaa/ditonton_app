import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvserials/domain/usecases/tv/get_popular_tv.dart';
import 'package:tvserials/presentation/bloc/popular_tv/popular_tv_bloc.dart';
import '../../../dummy_data/dummy_objects_tv.dart';
import 'popular_tv_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTvSerials])
void main() {
  late PopularTvBloc popularTvBloc;
  late MockGetPopularTvSerials mockGetPopularTvSerials;

  setUp(() {
    mockGetPopularTvSerials = MockGetPopularTvSerials();
    popularTvBloc = PopularTvBloc(mockGetPopularTvSerials);
  });
  group('Get Popular Tv Serials', () {
    blocTest<PopularTvBloc, PopularTvState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetPopularTvSerials.execute())
            .thenAnswer((_) async => Right(testTvSerialList));
        return popularTvBloc;
      },
      act: (bloc) => bloc.add(OnPopularTvCalled()),
      expect: () => [
        PopularTvLoading(),
        PopularTvHasData(testTvSerialList),
      ],
      verify: (bloc) {
        verify(mockGetPopularTvSerials.execute());
      },
    );
    blocTest<PopularTvBloc, PopularTvState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetPopularTvSerials.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return popularTvBloc;
      },
      act: (bloc) => bloc.add(OnPopularTvCalled()),
      expect: () => [
        PopularTvLoading(),
        const PopularTvError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetPopularTvSerials.execute());
      },
    );
    test('initial state should be empty', () {
      expect(popularTvBloc.state, PopularTvEmpty());
    });
  });
}
