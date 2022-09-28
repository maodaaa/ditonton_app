import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/repositories/tv_repository.dart';

class GetTvSerialRecommendations {
  final TvSerialRepository repository;

  GetTvSerialRecommendations(this.repository);

  Future<Either<Failure, List<TvSerial>>> execute(id) {
    return repository.getTvSerialRecommendations(id);
  }
}
