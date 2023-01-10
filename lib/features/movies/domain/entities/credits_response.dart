import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/features/movies/domain/entities/cast.dart';

class CreditsResponse extends Equatable {
  final int id;
  final List<Cast> cast;
  final List<Cast> crew;

  const CreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  @override
  List<Object?> get props => [id, cast, crew];
}
