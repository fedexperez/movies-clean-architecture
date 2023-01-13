part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();

  @override
  List<Object> get props => [];
}

class GetCastEvent extends CastEvent {
  final int movieId;

  const GetCastEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
