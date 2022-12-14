import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/repositories/tv_repository.dart';

class GetWatchlistTvSerial {
  final TvSerialRepository _repository;

  GetWatchlistTvSerial(this._repository);

  Future<Either<Failure, List<TvSerial>>> execute() {
    return _repository.getWatchlistTvSerials();
  }
}
