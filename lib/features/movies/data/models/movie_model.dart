import 'dart:convert';

import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required bool adult,
    String? backdropPath,
    required List<int> genreIds,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    String? posterPath,
    String? releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
    String? heroId,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
          heroId: heroId,
        );

  factory MovieModel.fromJson(String str) =>
      MovieModel.fromMapCustomImpl(json.decode(str), '');

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        heroId: '',
      );

  factory MovieModel.fromMapCustomImpl(
          Map<String, dynamic> json, String heroIdentifier) =>
      MovieModel(
        adult: json["adult"],
        backdropPath: (json["backdrop_path"] != null)
            ? 'https://image.tmdb.org/t/p/w500${json["backdrop_path"]}'
            : 'https://i.stack.imgur.com/GNhxO.png',
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: (json["poster_path"] != null)
            ? 'https://image.tmdb.org/t/p/w500${json["poster_path"]}'
            : 'https://i.stack.imgur.com/GNhxO.png',
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        heroId: '$heroIdentifier-${json["id"]}',
      );
}
