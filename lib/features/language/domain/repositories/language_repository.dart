import 'package:dartz/dartz.dart';

import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/features/language/domain/entities/language.dart';

abstract class LanguageRepository {
  Future<Either<Failure, Language>> setLocaleLanguage(Language language);
  Future<Either<Failure, Language>> checkLocaleLanguage();
}
