part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitialState extends MoviesState {}

class LoadingState extends MoviesState {}

class LoadedMoviesState extends MoviesState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;

  const LoadedMoviesState(
      {required this.nowPlayingMovies, required this.popularMovies});

  @override
  List<Object> get props => [nowPlayingMovies, popularMovies];
}

class ErrorState extends MoviesState {
  final String errorMessage;

  const ErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
