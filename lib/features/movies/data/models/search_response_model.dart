import 'dart:convert';

import 'package:clean_architecture_movies/features/movies/data/models/movie_model.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/search_response.dart';

class SearchResponseModel extends SearchResponse {
  const SearchResponseModel({
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

  factory SearchResponseModel.fromJson(String str) =>
      SearchResponseModel.fromMap(json.decode(str));

  factory SearchResponseModel.fromMap(Map<String, dynamic> json) =>
      SearchResponseModel(
        page: json["page"],
        results: List<MovieModel>.from(json["results"]
            .map((x) => MovieModel.fromMapCustomImpl(x, 'search'))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
