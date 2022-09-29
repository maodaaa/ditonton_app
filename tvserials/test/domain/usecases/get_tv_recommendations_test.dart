import 'package:dartz/dartz.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSerialRecommendations usecase;
  late MockTvSerialRepository mockTvSerialRepository;

  setUp(() {
    mockTvSerialRepository = MockTvSerialRepository();
    usecase = GetTvSerialRecommendations(mockTvSerialRepository);
  });

  final tId = 1;
  final tTvserial = <TvSerial>[];

  test('should get list of Tv recommendations from the repository', () async {
    // arrange
    when(mockTvSerialRepository.getTvSerialRecommendations(tId))
        .thenAnswer((_) async => Right(tTvserial));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(tTvserial));
  });
}
