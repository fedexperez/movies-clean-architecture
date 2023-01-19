import 'dart:convert';

import 'package:clean_architecture_movies/features/movies/domain/entities/cast.dart';

class CastModel extends Cast {
  const CastModel({
    required bool adult,
    required int gender,
    required int id,
    required String knownForDepartment,
    required String name,
    required String originalName,
    required double popularity,
    String? profilePath,
    int? castId,
    String? character,
    required String creditId,
    int? order,
    String? department,
    String? job,
  }) : super(
          adult: adult,
          gender: gender,
          id: id,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
          castId: castId,
          character: character,
          creditId: creditId,
          order: order,
          department: department,
          job: job,
        );

  factory CastModel.fromJson(String str) => CastModel.fromMap(json.decode(str));

  factory CastModel.fromMap(Map<String, dynamic> json) => CastModel(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: (json["profile_path"] != null)
            ? 'https://image.tmdb.org/t/p/w500${json["profile_path"]}'
            : 'https://i.stack.imgur.com/GNhxO.png',
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
      );
}
