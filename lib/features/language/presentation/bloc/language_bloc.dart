import 'package:bloc/bloc.dart';
import 'package:clean_architecture_movies/core/usecases/usecase.dart';
import 'package:clean_architecture_movies/features/language/domain/entities/language.dart';
import 'package:clean_architecture_movies/features/language/domain/usecases/check_locale_language.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_architecture_movies/features/language/domain/usecases/set_locale_language.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SetLocaleLanguage setLocaleLanguage;
  final CheckLocaleLanguage checkLocaleLanguage;

  LanguageBloc(
      {required this.setLocaleLanguage, required this.checkLocaleLanguage})
      : super(const LanguageInitialState(languageCode: 'en')) {
    on<SetLanguageEvent>((event, emit) async {
      print('seteando language');
      final failureOrLanguage =
          await setLocaleLanguage(Params(language: event.language));

      failureOrLanguage.fold((failure) {
        print(failure);
        emit(const LanguageErrorState(errorMessage: 'Language Error'));
        print('Fallamos');
      }, (language) {
        emit(LanguageSetState(language: language));
        print('seteado el lenguaje state');
      });
    });

    on<CheckLanguageEvent>((event, emit) async {
      final failureOrLanguage = await checkLocaleLanguage(NoParams());
      failureOrLanguage.fold((failure) {
        print('error checkeando el lenguage');
        emit(const LanguageErrorState(errorMessage: 'Language Error'));
      }, (language) {
        print('checkeando lenguage');
        emit(LanguageSetState(language: language));
      });
    });
  }
}
