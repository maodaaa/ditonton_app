// Mocks generated by Mockito 5.3.2 from annotations
// in ditonton/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i25;
import 'dart:typed_data' as _i26;

import 'package:core/data/datasources/db/database_helper_movie.dart' as _i24;
import 'package:core/data/datasources/db/database_helper_tv_serial.dart'
    as _i22;
import 'package:core/data/datasources/movie/movie_local_data_source.dart'
    as _i18;
import 'package:core/data/datasources/movie/movie_remote_data_source.dart'
    as _i14;
import 'package:core/data/datasources/tv/tv_local_data_source.dart' as _i20;
import 'package:core/data/datasources/tv/tv_remote_data_source.dart' as _i16;
import 'package:core/data/models/movie/movie_detail_model.dart' as _i3;
import 'package:core/data/models/movie/movie_model.dart' as _i15;
import 'package:core/data/models/movie/movie_table.dart' as _i19;
import 'package:core/data/models/tv/tv_detail_model.dart' as _i4;
import 'package:core/data/models/tv/tv_model.dart' as _i17;
import 'package:core/data/models/tv/tv_table.dart' as _i21;
import 'package:movies/domain/entities/movie/movie.dart' as _i9;
import 'package:movies/domain/entities/movie/movie_detail.dart' as _i10;
import 'package:tvserials/domain/entities/tv/tv.dart' as _i12;
import 'package:tvserials/domain/entities/tv/tv_detail.dart' as _i13;
import 'package:movies/domain/repositories/movie_repository.dart' as _i6;
import 'package:tvserials/domain/repositories/tv_repository.dart' as _i11;
import 'package:core/utils/failure.dart' as _i8;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i23;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetailResponse_1 extends _i1.SmartFake
    implements _i3.MovieDetailResponse {
  _FakeMovieDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSerialDetailResponse_2 extends _i1.SmartFake
    implements _i4.TvSerialDetailResponse {
  _FakeTvSerialDetailResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_3 extends _i1.SmartFake implements _i5.Response {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_4 extends _i1.SmartFake
    implements _i5.StreamedResponse {
  _FakeStreamedResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i6.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, _i10.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, _i10.MovieDetail>>.value(
                _FakeEither_0<_i8.Failure, _i10.MovieDetail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i10.MovieDetail>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #getMovieRecommendations,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlist(
          _i10.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [movie],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [movie],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> removeWatchlist(
          _i10.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [movie],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #getWatchlistMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
}

/// A class which mocks [TvSerialRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSerialRepository extends _i1.Mock
    implements _i11.TvSerialRepository {
  MockTvSerialRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>
      getNowPlayingTvSerials() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingTvSerials,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i12.TvSerial>>(
              this,
              Invocation.method(
                #getNowPlayingTvSerials,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>
      getPopularTvSerials() => (super.noSuchMethod(
            Invocation.method(
              #getPopularTvSerials,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i12.TvSerial>>(
              this,
              Invocation.method(
                #getPopularTvSerials,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>
      getTopRatedTvSerials() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTvSerials,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i12.TvSerial>>(
              this,
              Invocation.method(
                #getTopRatedTvSerials,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, _i13.TvSerialDetail>> getTvSerialDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSerialDetail,
          [id],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, _i13.TvSerialDetail>>.value(
                _FakeEither_0<_i8.Failure, _i13.TvSerialDetail>(
          this,
          Invocation.method(
            #getTvSerialDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i13.TvSerialDetail>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>
      getTvSerialRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getTvSerialRecommendations,
              [id],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i12.TvSerial>>(
              this,
              Invocation.method(
                #getTvSerialRecommendations,
                [id],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>> searchTvSerials(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSerials,
          [query],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>.value(
                _FakeEither_0<_i8.Failure, List<_i12.TvSerial>>(
          this,
          Invocation.method(
            #searchTvSerials,
            [query],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlistTvSerial(
          _i13.TvSerialDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistTvSerial,
          [tv],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistTvSerial,
            [tv],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> removeWatchlistTvSerial(
          _i13.TvSerialDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvSerial,
          [tv],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlistTvSerial,
            [tv],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlistTvSerial(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlistTvSerial,
          [id],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>
      getWatchlistTvSerials() => (super.noSuchMethod(
            Invocation.method(
              #getWatchlistTvSerials,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i12.TvSerial>>(
              this,
              Invocation.method(
                #getWatchlistTvSerials,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i12.TvSerial>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i14.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i15.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue:
            _i7.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i7.Future<List<_i15.MovieModel>>);
  @override
  _i7.Future<List<_i15.MovieModel>> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i7.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i7.Future<List<_i15.MovieModel>>);
  @override
  _i7.Future<List<_i15.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i7.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i7.Future<List<_i15.MovieModel>>);
  @override
  _i7.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i7.Future<_i3.MovieDetailResponse>.value(
            _FakeMovieDetailResponse_1(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.MovieDetailResponse>);
  @override
  _i7.Future<List<_i15.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue:
            _i7.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i7.Future<List<_i15.MovieModel>>);
  @override
  _i7.Future<List<_i15.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i7.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i7.Future<List<_i15.MovieModel>>);
}

/// A class which mocks [TvSerialRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSerialRemoteDataSource extends _i1.Mock
    implements _i16.TvSerialRemoteDataSource {
  MockTvSerialRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i17.TvSerialModel>> getNowPlayingTvSerials() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingTvSerials,
          [],
        ),
        returnValue:
            _i7.Future<List<_i17.TvSerialModel>>.value(<_i17.TvSerialModel>[]),
      ) as _i7.Future<List<_i17.TvSerialModel>>);
  @override
  _i7.Future<List<_i17.TvSerialModel>> getPopularTvSerials() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvSerials,
          [],
        ),
        returnValue:
            _i7.Future<List<_i17.TvSerialModel>>.value(<_i17.TvSerialModel>[]),
      ) as _i7.Future<List<_i17.TvSerialModel>>);
  @override
  _i7.Future<List<_i17.TvSerialModel>> getTopRatedTvSerials() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvSerials,
          [],
        ),
        returnValue:
            _i7.Future<List<_i17.TvSerialModel>>.value(<_i17.TvSerialModel>[]),
      ) as _i7.Future<List<_i17.TvSerialModel>>);
  @override
  _i7.Future<_i4.TvSerialDetailResponse> getTvSerialDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSerialDetail,
          [id],
        ),
        returnValue: _i7.Future<_i4.TvSerialDetailResponse>.value(
            _FakeTvSerialDetailResponse_2(
          this,
          Invocation.method(
            #getTvSerialDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i4.TvSerialDetailResponse>);
  @override
  _i7.Future<List<_i17.TvSerialModel>> getTvSerialRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSerialRecommendations,
          [id],
        ),
        returnValue:
            _i7.Future<List<_i17.TvSerialModel>>.value(<_i17.TvSerialModel>[]),
      ) as _i7.Future<List<_i17.TvSerialModel>>);
  @override
  _i7.Future<List<_i17.TvSerialModel>> searchTvSerials(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSerials,
          [query],
        ),
        returnValue:
            _i7.Future<List<_i17.TvSerialModel>>.value(<_i17.TvSerialModel>[]),
      ) as _i7.Future<List<_i17.TvSerialModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i18.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i19.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [movie],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlist(_i19.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<_i19.MovieTable?> getMovieById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i7.Future<_i19.MovieTable?>.value(),
      ) as _i7.Future<_i19.MovieTable?>);
  @override
  _i7.Future<List<_i19.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue:
            _i7.Future<List<_i19.MovieTable>>.value(<_i19.MovieTable>[]),
      ) as _i7.Future<List<_i19.MovieTable>>);
}

/// A class which mocks [TvSerialLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSerialLocalDataSource extends _i1.Mock
    implements _i20.TvSerialLocalDataSource {
  MockTvSerialLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlistTvSerial(_i21.TvSerialTable? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTvSerial,
          [tv],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlistTvSerial(_i21.TvSerialTable? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvSerial,
          [tv],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<_i21.TvSerialTable?> getTvSerialById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSerialById,
          [id],
        ),
        returnValue: _i7.Future<_i21.TvSerialTable?>.value(),
      ) as _i7.Future<_i21.TvSerialTable?>);
  @override
  _i7.Future<List<_i21.TvSerialTable>> getWatchlistTvSerials() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvSerials,
          [],
        ),
        returnValue:
            _i7.Future<List<_i21.TvSerialTable>>.value(<_i21.TvSerialTable>[]),
      ) as _i7.Future<List<_i21.TvSerialTable>>);
}

/// A class which mocks [DatabaseHelperTvSerial].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTvSerial extends _i1.Mock
    implements _i22.DatabaseHelperTvSerial {
  MockDatabaseHelperTvSerial() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i23.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i7.Future<_i23.Database?>.value(),
      ) as _i7.Future<_i23.Database?>);
  @override
  _i7.Future<int> insertWatchlistTvSerial(_i21.TvSerialTable? tvSerial) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTvSerial,
          [tvSerial],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlistTvSerial(_i21.TvSerialTable? tvSerial) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvSerial,
          [tvSerial],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getTvSerialById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSerialById,
          [id],
        ),
        returnValue: _i7.Future<Map<String, dynamic>?>.value(),
      ) as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistTvSerials() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvSerials,
          [],
        ),
        returnValue: _i7.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [DatabaseHelperMovie].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperMovie extends _i1.Mock
    implements _i24.DatabaseHelperMovie {
  MockDatabaseHelperMovie() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i23.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i7.Future<_i23.Database?>.value(),
      ) as _i7.Future<_i23.Database?>);
  @override
  _i7.Future<int> insertWatchlist(_i19.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [movie],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlist(_i19.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i7.Future<Map<String, dynamic>?>.value(),
      ) as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i7.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i25.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i25.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i25.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<_i5.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i25.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);
  @override
  _i7.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<_i26.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i26.Uint8List>.value(_i26.Uint8List(0)),
      ) as _i7.Future<_i26.Uint8List>);
  @override
  _i7.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i7.Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i7.Future<_i5.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
