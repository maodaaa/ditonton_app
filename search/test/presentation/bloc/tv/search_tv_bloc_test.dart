import 'package:bloc_test/bloc_test.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usecase/tv/search_tv.dart';
import 'package:search/presentation/bloc/tv/search_tv_bloc.dart';
import 'search_tv_bloc_test.mocks.dart';

@GenerateMocks([SearchTvSerials])
void main() {
  late SearchTvSerialsBloc searchTvSerialsBloc;
  late MockSearchTvSerials mockSearchTvSerials;

  setUp(() {
    mockSearchTvSerials = MockSearchTvSerials();
    searchTvSerialsBloc = SearchTvSerialsBloc(mockSearchTvSerials);
  });

  final tTvSerialModel = TvSerial(
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

  final tTvSerialsList = <TvSerial>[tTvSerialModel];
  final tQuery = 'Pretty Little Liars';

  blocTest<SearchTvSerialsBloc, SearchTvSerialsState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTvSerials.execute(tQuery))
          .thenAnswer((_) async => Right(tTvSerialsList));
      return searchTvSerialsBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoading(),
      SearchHasData(tTvSerialsList),
    ],
    verify: (bloc) {
      verify(mockSearchTvSerials.execute(tQuery));
    },
  );
  blocTest<SearchTvSerialsBloc, SearchTvSerialsState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchTvSerials.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return searchTvSerialsBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoading(),
      SearchError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchTvSerials.execute(tQuery));
    },
  );
  test('initial state should be empty', () {
    expect(searchTvSerialsBloc.state, SearchEmpty());
  });
}
