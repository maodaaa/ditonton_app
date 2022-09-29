import 'package:dartz/dartz.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:search/domain/usecase/tv/search_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../test_helper.mocks.dart';

void main() {
  late SearchTvSerials usecase;
  late MockTvSerialRepository mockTvSerialRepository;

  setUp(() {
    mockTvSerialRepository = MockTvSerialRepository();
    usecase = SearchTvSerials(mockTvSerialRepository);
  });

  final tTvSerial = <TvSerial>[];
  const tQuery = 'Game of thrones';

  test('should get list of Tv from the repository', () async {
    // arrange
    when(mockTvSerialRepository.searchTvSerials(tQuery))
        .thenAnswer((_) async => Right(tTvSerial));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tTvSerial));
  });
}
