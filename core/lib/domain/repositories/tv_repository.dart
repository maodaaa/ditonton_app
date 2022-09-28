import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/entities/tv/tv_detail.dart';
import 'package:core/utils/failure.dart';

abstract class TvSerialRepository {
  Future<Either<Failure, List<TvSerial>>> getNowPlayingTvSerials();
  Future<Either<Failure, List<TvSerial>>> getPopularTvSerials();
  Future<Either<Failure, List<TvSerial>>> getTopRatedTvSerials();
  Future<Either<Failure, TvSerialDetail>> getTvSerialDetail(int id);
  Future<Either<Failure, List<TvSerial>>> getTvSerialRecommendations(int id);
  Future<Either<Failure, List<TvSerial>>> searchTvSerials(String query);
  Future<Either<Failure, String>> saveWatchlistTvSerial(TvSerialDetail tv);
  Future<Either<Failure, String>> removeWatchlistTvSerial(TvSerialDetail tv);
  Future<bool> isAddedToWatchlistTvSerial(int id);
  Future<Either<Failure, List<TvSerial>>> getWatchlistTvSerials();
}
