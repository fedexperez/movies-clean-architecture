import 'dart:convert';

import 'package:clean_architecture_movies/core/errors/exceptions.dart';
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
    final jsonString = sharedPreferences.getString(Constants.cachedLanguage);
    if (jsonString != null) {
      final cachedLanguage = LanguageModel.fromJson(json.decode(jsonString));
      return cachedLanguage;
    } else {
      const LanguageModel defaultLanguage = LanguageModel(
        languageCode: 'en',
        languageName: 'English',
      );
      sharedPreferences.setString(
        Constants.cachedLanguage,
        json.encode(defaultLanguage.toJson()),
      );
      return defaultLanguage;
    }
  }

  @override
  Future<LanguageModel> cacheLanguage(Language languageToCache) async {
    if (languageToCache.toString().isNotEmpty) {
      final LanguageModel toCache = LanguageModel(
        languageCode: languageToCache.languageCode,
        country: languageToCache.country,
        languageName: languageToCache.languageName,
      );
      sharedPreferences.setString(
          Constants.cachedLanguage, json.encode(toCache.toJson()));
      return toCache;
    } else {
      throw CacheException();
    }
  }
}
