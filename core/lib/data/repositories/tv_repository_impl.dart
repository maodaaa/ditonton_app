import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:core/data/datasources/tv/tv_local_data_source.dart';
import 'package:core/data/datasources/tv/tv_remote_data_source.dart';
import 'package:core/data/models/tv/tv_table.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/entities/tv/tv_detail.dart';
import 'package:core/domain/repositories/tv_repository.dart';
import 'package:core/utils/exception.dart';
import 'package:core/utils/failure.dart';

class TvSerialRepositoryImpl implements TvSerialRepository {
  final TvSerialRemoteDataSource remoteDataSource;
  final TvSerialLocalDataSource localDataSource;

  TvSerialRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<TvSerial>>> getNowPlayingTvSerials() async {
    try {
      final result = await remoteDataSource.getNowPlayingTvSerials();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvSerialDetail>> getTvSerialDetail(int id) async {
    try {
      final result = await remoteDataSource.getTvSerialDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSerial>>> getTvSerialRecommendations(
      int id) async {
    try {
      final result = await remoteDataSource.getTvSerialRecommendations(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSerial>>> getPopularTvSerials() async {
    try {
      final result = await remoteDataSource.getPopularTvSerials();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSerial>>> getTopRatedTvSerials() async {
    try {
      final result = await remoteDataSource.getTopRatedTvSerials();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSerial>>> searchTvSerials(String query) async {
    try {
      final result = await remoteDataSource.searchTvSerials(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlistTvSerial(
      TvSerialDetail tvSerial) async {
    try {
      final result = await localDataSource
          .insertWatchlistTvSerial(TvSerialTable.fromEntity(tvSerial));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlistTvSerial(
      TvSerialDetail tvSerial) async {
    try {
      final result = await localDataSource
          .removeWatchlistTvSerial(TvSerialTable.fromEntity(tvSerial));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedToWatchlistTvSerial(int id) async {
    final result = await localDataSource.getTvSerialById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<TvSerial>>> getWatchlistTvSerials() async {
    final result = await localDataSource.getWatchlistTvSerials();
    return Right(result.map((data) => data.toEntity()).toList());
  }
}
