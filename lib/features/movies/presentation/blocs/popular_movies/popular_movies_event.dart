part of 'popular_movies_bloc.dart';

abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMoviesEvent extends PopularMoviesEvent {
  final List<Movie> popularMovies;

  const GetPopularMoviesEvent({required this.popularMovies});

  @override
  List<Object> get props => [popularMovies];
}

class UpdatePopularMoviesEvent extends PopularMoviesEvent {
  final List<Movie> popularMovies;

  const UpdatePopularMoviesEvent({required this.popularMovies});

  @override
  List<Object> get props => [popularMovies];
}
