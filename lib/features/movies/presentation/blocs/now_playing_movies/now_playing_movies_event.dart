part of 'now_playing_movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {
  const GetNowPlayingMoviesEvent();

  @override
  List<Object> get props => [];
}
