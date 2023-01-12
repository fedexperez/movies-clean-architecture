part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitialState extends CastState {}

class LoadedCastState extends CastState {
  final List<Cast> castList;

  const LoadedCastState({required this.castList});

  @override
  List<Object> get props => [castList];
}

class ErrorState extends CastState {
  final String errorMessage;

  const ErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
