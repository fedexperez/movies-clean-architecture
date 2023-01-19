import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_suggestions_by_query.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSuggestionsByQuery getSuggestionsByQuery;

  SearchBloc({required this.getSuggestionsByQuery})
      : super(SearchInitialState()) {
    on<SearchMovieEvent>((event, emit) async {
      final failureOrMovie =
          await getSuggestionsByQuery(Params(query: event.query));
      failureOrMovie.fold((failure) {
        emit(const SearchErrorState(errorMessage: 'Server Failure'));
      }, (movies) {
        emit(SearchLoadedState(movies: movies));
      });
    });
  }
}
