part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class SetLanguageEvent extends LanguageEvent {
  final Language language;

  const SetLanguageEvent({required this.language});

  @override
  List<Object> get props => [language];
}

class CheckLanguageEvent extends LanguageEvent {}
