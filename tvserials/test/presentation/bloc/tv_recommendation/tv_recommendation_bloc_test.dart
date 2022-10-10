import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:tvserials/presentation/bloc/tv_recommendation/tv_recommendation_bloc.dart';
import '../../../dummy_data/dummy_objects_tv.dart';
import 'tv_recommendation_bloc_test.mocks.dart';

@GenerateMocks([GetTvSerialRecommendations])
void main() {
  late TvRecommendationBloc tvRecommendationBloc;
  late MockGetTvSerialRecommendations mockGetTvSerialRecommendations;

  setUp(() {
    mockGetTvSerialRecommendations = MockGetTvSerialRecommendations();
    tvRecommendationBloc = TvRecommendationBloc(mockGetTvSerialRecommendations);
  });
  const tId = 1;

  group('Tv Serial Recommendations', () {
    blocTest<TvRecommendationBloc, TvRecommendationState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTvSerialRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testTvSerialList));
        return tvRecommendationBloc;
      },
      act: (bloc) => bloc.add(const OnTvRecommendationCalled(tId)),
      expect: () => [
        TvRecommendationLoading(),
        TvRecommendationHasData(testTvSerialList),
      ],
      verify: (bloc) {
        verify(mockGetTvSerialRecommendations.execute(tId));
      },
    );
    blocTest<TvRecommendationBloc, TvRecommendationState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTvSerialRecommendations.execute(tId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return tvRecommendationBloc;
      },
      act: (bloc) => bloc.add(const OnTvRecommendationCalled(tId)),
      expect: () => [
        TvRecommendationLoading(),
        const TvRecommendationError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTvSerialRecommendations.execute(tId));
      },
    );
    test('initial state should be empty', () {
      expect(tvRecommendationBloc.state, TvRecommendationEmpty());
    });
  });
}
