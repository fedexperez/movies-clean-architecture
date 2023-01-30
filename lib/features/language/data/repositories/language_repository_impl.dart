import 'package:clean_architecture_movies/features/language/data/datasources/language_local_data_source.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_architecture_movies/features/language/domain/entities/language.dart';
import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/features/language/domain/repositories/language_repository.dart';

class LanguageRespositoryImpl implements LanguageRepository {
  final LanguageLocalDataSource languageLocalDataSource;

  LanguageRespositoryImpl({required this.languageLocalDataSource});

  @override
  Future<Either<Failure, Language>> setLocaleLanguage(Language language) async {
    try {
      final localeLanguage =
          await languageLocalDataSource.cacheLanguage(language);
      return Right(localeLanguage);
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Language>> checkLocaleLanguage() async {
    // try {
    //   final localeLanguage =
    //       await languageLocalDataSource.checkLocaleLanguage();
    //   return Right(localeLanguage);
    // } catch (e) {
    //   print(e);
    //   return Left(ServerFailure());
    // }
    final localeLanguage = await languageLocalDataSource.checkLocaleLanguage();
    return Right(localeLanguage);
  }
}
