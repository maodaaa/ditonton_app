import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/repositories/tv_repository.dart';

class GetPopularTvSerials {
  final TvSerialRepository repository;

  GetPopularTvSerials(this.repository);

  Future<Either<Failure, List<TvSerial>>> execute() {
    return repository.getPopularTvSerials();
  }
}
