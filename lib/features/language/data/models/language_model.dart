import 'dart:convert';

import 'package:clean_architecture_movies/features/language/domain/entities/language.dart';

class LanguageModel extends Language {
  const LanguageModel(
      {required String languageCode,
      String? country,
      required String languageName})
      : super(
          languageCode: languageCode,
          country: country,
          languageName: languageName,
        );

  factory LanguageModel.fromJson(String str) =>
      LanguageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LanguageModel.fromMap(Map<String, dynamic> json) => LanguageModel(
        languageCode: json["languageCode"],
        country: json["country"],
        languageName: json["languageName"],
      );

  Map<String, dynamic> toMap() => {
        "languageCode": languageCode,
        "country": country,
        "languageName": languageName,
      };
}
