import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/usecases/tv/get_popular_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTvSerials usecase;
  late MockTvSerialRepository mockTvSerialRpository;

  setUp(() {
    mockTvSerialRpository = MockTvSerialRepository();
    usecase = GetPopularTvSerials(mockTvSerialRpository);
  });

  final tTvSerial = <TvSerial>[];

  group('GetPopularTv Tests', () {
    group('execute', () {
      test(
          'should get list of Tv from the repository when execute function is called',
          () async {
        // arrange
        when(mockTvSerialRpository.getPopularTvSerials())
            .thenAnswer((_) async => Right(tTvSerial));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tTvSerial));
      });
    });
  });
}
