import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/repositories/tv_repository.dart';

class GetTopRatedTvSerials {
  final TvSerialRepository repository;

  GetTopRatedTvSerials(this.repository);

  Future<Either<Failure, List<TvSerial>>> execute() {
    return repository.getTopRatedTvSerials();
  }
}
