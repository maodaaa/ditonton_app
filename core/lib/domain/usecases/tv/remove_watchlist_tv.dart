import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/domain/entities/tv/tv_detail.dart';
import 'package:core/domain/repositories/tv_repository.dart';

class RemoveWatchlistTvSerial {
  final TvSerialRepository repository;

  RemoveWatchlistTvSerial(this.repository);

  Future<Either<Failure, String>> execute(TvSerialDetail tvSerial) {
    return repository.removeWatchlistTvSerial(tvSerial);
  }
}
