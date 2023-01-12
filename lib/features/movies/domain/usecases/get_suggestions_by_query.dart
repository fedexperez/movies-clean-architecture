import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/core/usecases/usecase.dart';
import 'package:clean_architecture_movies/features/movies/domain/repositories/movie_repository.dart';

class GetSuggestionsByQuery implements UseCase<void, Params> {
  final MovieRepository repository;

  GetSuggestionsByQuery({required this.repository});

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.searchMovies(params.searchTerm);
  }
}

class Params extends Equatable {
  final String searchTerm;

  const Params({required this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}
