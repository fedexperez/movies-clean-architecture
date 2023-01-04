import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/core/usecases/usecase.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies/features/movies/domain/repositories/movie_repository.dart';

class GetMovie implements UseCase<Movie, Params> {
  final MovieRepository movieRepository;

  GetMovie(this.movieRepository);

  @override
  Future<Either<Failure, Movie>> call(Params params) async {
    return await movieRepository.getMovie(params.movieNumber);
  }
}

class Params extends Equatable {
  final String movieNumber;

  const Params({required this.movieNumber});

  @override
  List<Object?> get props => [movieNumber];
}
