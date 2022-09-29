import 'package:dartz/dartz.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetNowPlayingTvSerials usecase;
  late MockTvSerialRepository mockTvSerialRepository;

  setUp(() {
    mockTvSerialRepository = MockTvSerialRepository();
    usecase = GetNowPlayingTvSerials(mockTvSerialRepository);
  });

  final tTvSerial = <TvSerial>[];

  test('should get list of tv from the repository', () async {
    // arrange
    when(mockTvSerialRepository.getNowPlayingTvSerials())
        .thenAnswer((_) async => Right(tTvSerial));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvSerial));
  });
}
