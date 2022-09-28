import 'package:core/data/datasources/db/database_helper_movie.dart';
import 'package:core/data/datasources/db/database_helper_tv_serial.dart';
import 'package:core/data/datasources/movie/movie_local_data_source.dart';
import 'package:core/data/datasources/movie/movie_remote_data_source.dart';
import 'package:core/data/datasources/tv/tv_local_data_source.dart';
import 'package:core/data/datasources/tv/tv_remote_data_source.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/repositories/tv_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  TvSerialRepository,
  MovieRemoteDataSource,
  TvSerialRemoteDataSource,
  MovieLocalDataSource,
  TvSerialLocalDataSource,
  DatabaseHelperTvSerial,
  DatabaseHelperMovie,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
