import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:core/presentation/provider/tv/top_rated_tv_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'top_rated_tv_notifier_test.mocks.dart';

@GenerateMocks([GetTopRatedTvSerials])
void main() {
  late MockGetTopRatedTvSerials mockGetTopRatedTvSerials;
  late TopRatedTvSerialsNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTopRatedTvSerials = MockGetTopRatedTvSerials();
    notifier = TopRatedTvSerialsNotifier(
        getTopRatedTvSerials: mockGetTopRatedTvSerials)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tTvSerial = TvSerial(
      backdropPath: "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg",
      firstAirDate: "2010-06-08",
      genreIds: [1],
      id: 1,
      name: "Pretty Little Liars",
      originalName: "Pretty Little Liars",
      overview:
          "Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew.",
      popularity: 47.432451,
      posterPath: "/vC324sdfcS313vh9QXwijLIHPJp.jpg",
      voteAverage: 5.04,
      voteCount: 133);

  final tTvSerialList = <TvSerial>[tTvSerial];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetTopRatedTvSerials.execute())
        .thenAnswer((_) async => Right(tTvSerialList));
    // act
    notifier.fetchTopRatedTvSerials();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change tv Serials data when data is gotten successfully',
      () async {
    // arrange
    when(mockGetTopRatedTvSerials.execute())
        .thenAnswer((_) async => Right(tTvSerialList));
    // act
    await notifier.fetchTopRatedTvSerials();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tvSerials, tTvSerialList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetTopRatedTvSerials.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchTopRatedTvSerials();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
