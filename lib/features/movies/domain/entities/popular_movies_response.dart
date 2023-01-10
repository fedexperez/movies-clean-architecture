import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';

class PopularMovies extends Equatable {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  const PopularMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
