import 'package:dartz/dartz.dart';

import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/core/usecases/usecase.dart';
import 'package:clean_architecture_movies/features/language/domain/entities/language.dart';
import 'package:clean_architecture_movies/features/language/domain/repositories/language_repository.dart';

class GetLocaleLanguage implements UseCase<Language, NoParams> {
  final LanguageRepository repository;

  GetLocaleLanguage({required this.repository});

  @override
  Future<Either<Failure, Language>> call(NoParams noParams) async {
    return await repository.getLocaleLanguage();
  }
}
