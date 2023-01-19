import 'package:dartz/dartz.dart';

import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/cast.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Cast>>> getCreditsResponse(int movieId);
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, Stream<List<Movie>>>> getSuggestionsByQuery(
    String searchTerm,
  );
}
