part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitialState extends CastState {}

class CastLoadingState extends CastState {}

class CastLoadedState extends CastState {
  final List<Cast> castList;

  const CastLoadedState({required this.castList});

  @override
  List<Object> get props => [castList];
}

class CastErrorState extends CastState {
  final String errorMessage;

  const CastErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
