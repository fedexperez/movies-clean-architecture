import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String languageCode;
  final String? country;
  final String languageName;

  const Language(
      {required this.languageCode, this.country, required this.languageName});

  @override
  List<Object?> get props => [languageCode, country, languageName];
}
