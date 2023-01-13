import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/features/movies/domain/entities/cast.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_credits_response.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCreditsResponse getCreditsResponse;

  CastBloc({required this.getCreditsResponse}) : super(CastInitialState()) {
    on<GetCastEvent>((event, emit) async {
      final failureOrCast =
          await getCreditsResponse(Params(movieId: event.movieId));
      failureOrCast.fold((failure) {
        emit(const ErrorState(errorMessage: 'Server Failure'));
      }, (cast) {
        emit(LoadedCastState(castList: cast));
      });
    });
  }
}
