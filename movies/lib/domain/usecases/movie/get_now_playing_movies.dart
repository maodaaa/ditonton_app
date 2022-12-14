import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/movie/movie.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:core/utils/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
