import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/core/constants/constants.dart';
import 'package:clean_architecture_movies/core/usecases/usecase.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_now_playing_movies.dart';

part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc extends Bloc<MoviesEvent, NowPlayingMoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  NowPlayingMoviesBloc({required this.getNowPlayingMovies})
      : super(NowPlayingMoviesInitialState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      emit(NowPlayingMoviesLoadingState());
      final failureOrPlayingMovies = await getNowPlayingMovies(NoParams());
      failureOrPlayingMovies.fold((failure) {
        emit(const NowPlayingMoviesErrorState(
          errorMessage: Constants.serverFailureMessage,
        ));
      }, (movies) {
        emit(NowPlayingMoviesLoadedState(nowPlayingMovies: movies));
      });
    });
  }
}
