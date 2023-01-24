import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/core/errors/failures.dart';
import 'package:clean_architecture_movies/core/usecases/usecase.dart';
import 'package:clean_architecture_movies/features/language/domain/entities/language.dart';
import 'package:clean_architecture_movies/features/language/domain/repositories/language_repository.dart';

class SetLocaleLanguage implements UseCase<Language, Params> {
  final LanguageRepository repository;

  SetLocaleLanguage({required this.repository});

  @override
  Future<Either<Failure, Language>> call(Params params) async {
    return await repository.setLocaleLanguage(params.languageCode);
  }
}

class Params extends Equatable {
  final String languageCode;

  const Params({required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}
