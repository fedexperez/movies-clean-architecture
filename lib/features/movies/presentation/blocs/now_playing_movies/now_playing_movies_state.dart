part of 'now_playing_movies_bloc.dart';

abstract class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

class NowPlayingMoviesInitialState extends NowPlayingMoviesState {}

class NowPlayingMoviesLoadingState extends NowPlayingMoviesState {}

class NowPlayingMoviesLoadedState extends NowPlayingMoviesState {
  final List<Movie> nowPlayingMovies;

  const NowPlayingMoviesLoadedState({required this.nowPlayingMovies});

  @override
  List<Object> get props => [nowPlayingMovies];
}

class NowPlayingMoviesErrorState extends NowPlayingMoviesState {
  final String errorMessage;

  const NowPlayingMoviesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
