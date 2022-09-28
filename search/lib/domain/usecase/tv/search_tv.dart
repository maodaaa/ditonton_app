import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/repositories/tv_repository.dart';

class SearchTvSerials {
  final TvSerialRepository repository;

  SearchTvSerials(this.repository);

  Future<Either<Failure, List<TvSerial>>> execute(String query) {
    return repository.searchTvSerials(query);
  }
}
