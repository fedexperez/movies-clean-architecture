import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/core/usecases/usecase.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_suggestions_by_query.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/search_movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final SearchMovies searchMovies;
  final GetSuggestionsByQuery getSuggestionsByQuery;

  MoviesBloc({
    required this.getNowPlayingMovies,
    required this.getPopularMovies,
    required this.searchMovies,
    required this.getSuggestionsByQuery,
  }) : super(MoviesInitialState()) {
    on<GetMoviesEvent>((event, emit) async {
      final failureOrPlayingMovies = await getNowPlayingMovies(NoParams());
      final failureOrPopularMovies = await getPopularMovies(NoParams());
      List<Movie> nowPlayingMovies = [];
      List<Movie> popularMovies = [];

      failureOrPlayingMovies.fold((failure) {
        emit(const ErrorState(errorMessage: 'Server Failure'));
      }, (movies) {
        popularMovies = movies;
      });

      failureOrPopularMovies.fold((failure) {
        emit(const ErrorState(errorMessage: 'Server Failure'));
      }, (movies) {
        nowPlayingMovies = movies;
      });

      emit(LoadedMoviesState(
          nowPlayingMovies: nowPlayingMovies, popularMovies: popularMovies));
    });
  }
}
