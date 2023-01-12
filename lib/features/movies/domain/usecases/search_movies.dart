import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/core/usecases/usecase.dart';
import 'package:clean_architecture_movies/features/movies/domain/repositories/movie_repository.dart';

class SearchMovies implements UseCase<List<Movie>, Params> {
  final MovieRepository repository;

  SearchMovies({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(Params params) async {
    return await repository.searchMovies(params.query);
  }
}

class Params extends Equatable {
  final String query;

  const Params({required this.query});

  @override
  List<Object?> get props => [query];
}
