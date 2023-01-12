import 'package:clean_architecture_movies/features/movies/domain/usecases/get_credits_response.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_suggestions_by_query.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/search_movies.dart';
import 'package:clean_architecture_movies/features/movies/presentation/blocs/bloc/cast_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:clean_architecture_movies/core/platform/network_info.dart';
import 'package:clean_architecture_movies/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:clean_architecture_movies/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:clean_architecture_movies/features/movies/domain/repositories/movie_repository.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:clean_architecture_movies/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_architecture_movies/features/movies/presentation/blocs/movies/movies_bloc.dart';

final sl = GetIt.instance;

// void init() async {
Future<void> init() async {
  ///Features
  //Bloc
  sl.registerFactory(() => MoviesBloc(
        getNowPlayingMovies: sl(),
        getPopularMovies: sl(),
        getSuggestionsByQuery: sl(),
        searchMovies: sl(),
      ));

  sl.registerFactory(() => CastBloc(
        getCreditsResponse: sl(),
      ));

  //Usecases
  sl.registerLazySingleton(() => GetNowPlayingMovies(repository: sl()));
  sl.registerLazySingleton(() => GetPopularMovies(repository: sl()));
  sl.registerLazySingleton(() => GetCreditsResponse(repository: sl()));
  sl.registerLazySingleton(() => GetSuggestionsByQuery(repository: sl()));
  sl.registerLazySingleton(() => SearchMovies(repository: sl()));

  //Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        movieRemoteDataSource: sl(),
        networkInfo: sl(),
      ));

  //Data
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: sl()));

  ///Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///External
  ///Now SharedPreferences are type shared preferences an not type Future
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
