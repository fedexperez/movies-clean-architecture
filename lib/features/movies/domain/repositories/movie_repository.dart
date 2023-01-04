import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_architecture_movies/core/errors/failures.dart';

abstract class MovieRepository {
  Future<Either<Failure, Movie>> getMovie(String movieNumber);
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
}
