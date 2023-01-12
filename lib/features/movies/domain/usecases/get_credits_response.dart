import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/core/usecases/usecase.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/cast.dart';
import 'package:clean_architecture_movies/features/movies/domain/repositories/movie_repository.dart';

class GetCreditsResponse implements UseCase<List<Cast>, Params> {
  final MovieRepository repository;

  GetCreditsResponse({required this.repository});

  @override
  Future<Either<Failure, List<Cast>>> call(Params params) async {
    return await repository.getCreditsResponse(params.movieId);
  }
}

class Params extends Equatable {
  final int movieId;

  const Params({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
