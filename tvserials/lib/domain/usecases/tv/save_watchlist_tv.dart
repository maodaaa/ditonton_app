import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tvserials/domain/entities/tv/tv_detail.dart';
import 'package:tvserials/domain/repositories/tv_repository.dart';

class SaveWatchlistTvSerial {
  final TvSerialRepository repository;

  SaveWatchlistTvSerial(this.repository);

  Future<Either<Failure, String>> execute(TvSerialDetail tvSerial) {
    return repository.saveWatchlistTvSerial(tvSerial);
  }
}
