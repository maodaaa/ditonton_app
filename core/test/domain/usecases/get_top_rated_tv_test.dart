import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopRatedTvSerials usecase;
  late MockTvSerialRepository mockTvSerialRepository;

  setUp(() {
    mockTvSerialRepository = MockTvSerialRepository();
    usecase = GetTopRatedTvSerials(mockTvSerialRepository);
  });

  final tTvSerial = <TvSerial>[];

  test('should get list of Tv from repository', () async {
    // arrange
    when(mockTvSerialRepository.getTopRatedTvSerials())
        .thenAnswer((_) async => Right(tTvSerial));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvSerial));
  });
}
