part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitialState extends LanguageState {
  final String languageCode;

  const LanguageInitialState({required this.languageCode});

  @override
  List<Object> get props => [languageCode];
}

class LanguageChangingState extends LanguageState {}

class LanguageSetState extends LanguageState {
  final Language language;

  const LanguageSetState({required this.language});

  @override
  List<Object> get props => [language];
}

class LanguageErrorState extends LanguageState {
  final String errorMessage;

  const LanguageErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
