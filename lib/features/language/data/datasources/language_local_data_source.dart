import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:clean_architecture_movies/core/constants/constants.dart';
import 'package:clean_architecture_movies/features/language/data/models/language_model.dart';
import 'package:clean_architecture_movies/features/language/domain/entities/language.dart';

abstract class LanguageLocalDataSource {
  Future<LanguageModel> checkLocaleLanguage();
  Future<LanguageModel> cacheLanguage(Language languageToCache);
}

class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  final SharedPreferences sharedPreferences;

  LanguageLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LanguageModel> checkLocaleLanguage() async {
    print('geteando el lenguaje');
    final jsonString = sharedPreferences.getString(Constants.cachedLanguage);
    if (jsonString != null) {
      print('Si esta guardado');
      print(jsonString);
      return LanguageModel.fromJson(json.decode(jsonString));
    } else {
      print('se feu por default');
      const LanguageModel defaultLanguage =
          LanguageModel(languageCode: 'en', languageName: 'English');
      sharedPreferences.setString(
        Constants.cachedLanguage,
        json.encode(defaultLanguage.toJson()),
      );
      return defaultLanguage;
    }
  }

  @override
  Future<LanguageModel> cacheLanguage(Language languageToCache) async {
    print('$languageToCache pal cache');
    final LanguageModel toCache = LanguageModel(
      languageCode: languageToCache.languageCode,
      country: languageToCache.country,
      languageName: languageToCache.languageName,
    );
    sharedPreferences.setString(
        Constants.cachedLanguage, json.encode(toCache.toJson()));
    return toCache;
  }
}
