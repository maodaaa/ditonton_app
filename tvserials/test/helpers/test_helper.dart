import 'package:core/data/datasources/db/database_helper_tv_serial.dart';
import 'package:core/data/datasources/tv/tv_local_data_source.dart';
import 'package:core/data/datasources/tv/tv_remote_data_source.dart';
import 'package:tvserials/domain/repositories/tv_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  TvSerialRepository,
  TvSerialRemoteDataSource,
  TvSerialLocalDataSource,
  DatabaseHelperTvSerial,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
