import 'dart:convert';

import 'package:clean_architecture_movies/features/movies/domain/entities/credits_response.dart';
import 'package:clean_architecture_movies/features/movies/data/models/cast_model.dart';

class CreditsResponseModel extends CreditsResponse {
  const CreditsResponseModel({
    required int id,
    required List<CastModel> cast,
    required List<CastModel> crew,
  }) : super(id: id, cast: cast, crew: crew);

  factory CreditsResponseModel.fromJson(String str) =>
      CreditsResponseModel.fromMap(json.decode(str));

  factory CreditsResponseModel.fromMap(Map<String, dynamic> json) =>
      CreditsResponseModel(
        id: json["id"],
        cast:
            List<CastModel>.from(json["cast"].map((x) => CastModel.fromMap(x))),
        crew:
            List<CastModel>.from(json["crew"].map((x) => CastModel.fromMap(x))),
      );
}
