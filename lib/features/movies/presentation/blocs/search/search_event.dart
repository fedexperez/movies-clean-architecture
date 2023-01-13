part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchMovieEvent extends SearchEvent {
  final String query;

  const SearchMovieEvent({required this.query});

  @override
  List<Object> get props => [query];
}
