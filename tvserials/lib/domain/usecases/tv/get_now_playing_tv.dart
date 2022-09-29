import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/repositories/tv_repository.dart';

class GetNowPlayingTvSerials {
  final TvSerialRepository repository;

  GetNowPlayingTvSerials(this.repository);

  Future<Either<Failure, List<TvSerial>>> execute() {
    return repository.getNowPlayingTvSerials();
  }
}
