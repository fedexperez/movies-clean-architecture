import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String language;
  final String? country;

  const Language({required this.language, this.country});

  @override
  List<Object?> get props => [language, country];
}
