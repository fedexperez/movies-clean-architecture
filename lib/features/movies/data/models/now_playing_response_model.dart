import 'dart:convert';

import 'package:clean_architecture_movies/features/movies/data/models/dates_model.dart';
import 'package:clean_architecture_movies/features/movies/data/models/movie_model.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/now_playing_response.dart';

class NowPlayingMoviesModel extends NowPlayingMovies {
  const NowPlayingMoviesModel({
    required DatesModel dates,
    required int page,
    required List<MovieModel> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          dates: dates,
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory NowPlayingMoviesModel.fromJson(String str) =>
      NowPlayingMoviesModel.fromMap(json.decode(str));

  factory NowPlayingMoviesModel.fromMap(Map<String, dynamic> json) =>
      NowPlayingMoviesModel(
        dates: DatesModel.fromMap(json["dates"]),
        page: json["page"],
        results: List<MovieModel>.from(json["results"]
            .map((x) => MovieModel.fromMapCustomImpl(x, 'swipper'))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
