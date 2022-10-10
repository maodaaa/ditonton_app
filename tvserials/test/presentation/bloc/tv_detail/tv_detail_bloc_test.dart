import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_detail.dart';
import 'package:tvserials/presentation/bloc/tv_detail/tv_detail_bloc.dart';
import '../../../dummy_data/dummy_objects_tv.dart';
import 'tv_detail_bloc_test.mocks.dart';

@GenerateMocks([GetTvSerialDetail])
void main() {
  late TvDetailBloc tvDetailBloc;
  late MockGetTvSerialDetail mockGetTvSerialDetail;

  setUp(() {
    mockGetTvSerialDetail = MockGetTvSerialDetail();
    tvDetailBloc = TvDetailBloc(mockGetTvSerialDetail);
  });

  const tId = 1;
  group('Get Tv Serial Detail', () {
    blocTest<TvDetailBloc, TvDetailState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTvSerialDetail.execute(tId))
            .thenAnswer((_) async => Right(testTvSerialDetail));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(const OnTvDetailCalled(tId)),
      expect: () => [
        TvDetailLoading(),
        TvDetailHasData(testTvSerialDetail),
      ],
      verify: (bloc) {
        verify(mockGetTvSerialDetail.execute(tId));
      },
    );
    blocTest<TvDetailBloc, TvDetailState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockGetTvSerialDetail.execute(tId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(const OnTvDetailCalled(tId)),
      expect: () => [
        TvDetailLoading(),
        const TvDetailError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTvSerialDetail.execute(tId));
      },
    );
    test('initial state should be empty', () {
      expect(tvDetailBloc.state, TvDetailEmpty());
    });
  });
}
