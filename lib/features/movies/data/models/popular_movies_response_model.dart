import 'dart:convert';

import 'package:clean_architecture_movies/features/movies/domain/entities/popular_movies_response.dart';
import 'package:clean_architecture_movies/features/movies/data/models/movie_model.dart';

class PopularMoviesModel extends PopularMovies {
  const PopularMoviesModel({
    required int page,
    required List<MovieModel> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );
  factory PopularMoviesModel.fromJson(String str) =>
      PopularMoviesModel.fromMap(json.decode(str));

  factory PopularMoviesModel.fromMap(Map<String, dynamic> json) =>
      PopularMoviesModel(
        page: json["page"],
        results: List<MovieModel>.from(json["results"].map((x) {
          return MovieModel.fromMap(x);
        })),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
