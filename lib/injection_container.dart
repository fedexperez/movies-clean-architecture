import 'package:clean_architecture_movies/features/language/domain/usecases/check_locale_language.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:clean_architecture_movies/core/platform/network_info.dart';
import 'package:clean_architecture_movies/features/language/data/datasources/language_local_data_source.dart';
import 'package:clean_architecture_movies/features/language/data/repositories/language_repository_impl.dart';
import 'package:clean_architecture_movies/features/language/domain/repositories/language_repository.dart';
import 'package:clean_architecture_movies/features/language/domain/usecases/set_locale_language.dart';
import 'package:clean_architecture_movies/features/language/presentation/bloc/language_bloc.dart';
import 'package:clean_architecture_movies/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:clean_architecture_movies/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:clean_architecture_movies/features/movies/domain/repositories/movie_repository.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_credits_response.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_suggestions_by_query.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/search_movies.dart';
import 'package:clean_architecture_movies/features/movies/presentation/blocs/blocs.dart';

final sl = GetIt.instance;

// void init() async {
Future<void> init() async {
  ///Features
  //Bloc
  sl.registerFactory(() => NowPlayingMoviesBloc(getNowPlayingMovies: sl()));

  sl.registerFactory(() => PopularMoviesBloc(getPopularMovies: sl()));

  sl.registerFactory(() => CastBloc(getCreditsResponse: sl()));

  sl.registerFactory(() => SearchBloc(getSuggestionsByQuery: sl()));

  sl.registerFactory(
      () => LanguageBloc(checkLocaleLanguage: sl(), setLocaleLanguage: sl()));

  //Usecases
  sl.registerLazySingleton(() => GetNowPlayingMovies(repository: sl()));
  sl.registerLazySingleton(() => GetPopularMovies(repository: sl()));
  sl.registerLazySingleton(() => GetCreditsResponse(repository: sl()));
  sl.registerLazySingleton(() => GetSuggestionsByQuery(repository: sl()));
  sl.registerLazySingleton(() => SearchMovies(repository: sl()));
  sl.registerLazySingleton(() => SetLocaleLanguage(repository: sl()));
  sl.registerLazySingleton(() => CheckLocaleLanguage(repository: sl()));

  //Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        movieRemoteDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<LanguageRepository>(() => LanguageRespositoryImpl(
        languageLocalDataSource: sl(),
      ));

  //Data
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl(sharedPreferences: sl()));

  ///Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///External
  ///Now SharedPreferences are type shared preferences an not type Future
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Intl());
}
