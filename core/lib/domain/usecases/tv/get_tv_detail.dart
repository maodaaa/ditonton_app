import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/domain/entities/tv/tv_detail.dart';
import 'package:core/domain/repositories/tv_repository.dart';

class GetTvSerialDetail {
  final TvSerialRepository repository;

  GetTvSerialDetail(this.repository);

  Future<Either<Failure, TvSerialDetail>> execute(int id) {
    return repository.getTvSerialDetail(id);
  }
}
