import 'package:dartz/dartz.dart';

import 'package:clean_architecture_movies/core/errors/exceptions.dart';
import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/core/platform/network_info.dart';
import 'package:clean_architecture_movies/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/cast.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({
    required this.movieRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    networkInfo.isConnected;
    try {
      final nowPlayingMovies =
          await movieRemoteDataSource.getNowPlayingMovies();
      return Right(nowPlayingMovies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    networkInfo.isConnected;
    try {
      final popularMovies = await movieRemoteDataSource.getPopularMovies();
      return Right(popularMovies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Cast>>> getCreditsResponse(int movieId) async {
    networkInfo.isConnected;
    try {
      final creditsResponse =
          await movieRemoteDataSource.getCreditsResponse(movieId);
      return Right(creditsResponse);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> getSuggestionsByQuery(String searchTerm) async {
    networkInfo.isConnected;
    try {
      final suggestions =
          movieRemoteDataSource.getSuggestionsByQuery(searchTerm);
      return Right(suggestions);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    networkInfo.isConnected;
    try {
      final searchedMovies = await movieRemoteDataSource.searchMovies(query);
      return Right(searchedMovies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
