import 'package:dartz/dartz.dart';
import 'package:clean_architecture_movies/core/usecases/usecase.dart';

import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies/features/movies/domain/repositories/movie_repository.dart';

class GetNowPlayingMovies implements UseCase<List<Movie>, NoParams> {
  final MovieRepository movieRepository;

  GetNowPlayingMovies(this.movieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams noParams) async {
    return await movieRepository.getNowPlayingMovies();
  }
}
