part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadedState extends SearchState {
  final Stream<List<Movie>> movies;

  const SearchLoadedState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class ErrorState extends SearchState {
  final String errorMessage;

  const ErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
