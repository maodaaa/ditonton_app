import 'package:dartz/dartz.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects_tv.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSerialDetail usecase;
  late MockTvSerialRepository mockTvSerialRepository;

  setUp(() {
    mockTvSerialRepository = MockTvSerialRepository();
    usecase = GetTvSerialDetail(mockTvSerialRepository);
  });

  final tId = 1;

  test('should get tv detail from the repository', () async {
    // arrange
    when(mockTvSerialRepository.getTvSerialDetail(tId))
        .thenAnswer((_) async => Right(testTvSerialDetail));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(testTvSerialDetail));
  });
}
