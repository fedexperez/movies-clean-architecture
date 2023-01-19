part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitialState extends PopularMoviesState {}

class PopularMoviesLoadingState extends PopularMoviesState {}

class PopularMoviesLoadedState extends PopularMoviesState {
  final List<Movie> popularMovies;

  const PopularMoviesLoadedState({required this.popularMovies});

  @override
  List<Object> get props => [popularMovies];
}

class PopularMoviesErrorState extends PopularMoviesState {
  final String errorMessage;

  const PopularMoviesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
