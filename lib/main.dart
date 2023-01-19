import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_movies/core/router/app_routes.dart';
import 'package:clean_architecture_movies/core/ui/themes/app_theme.dart';
import 'package:clean_architecture_movies/features/movies/presentation/blocs/blocs.dart';
import 'package:clean_architecture_movies/features/movies/presentation/screens/screens.dart';
import 'package:clean_architecture_movies/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowPlayingMoviesBloc>(
          create: (context) =>
              sl<NowPlayingMoviesBloc>()..add(const GetNowPlayingMoviesEvent()),
        ),
        BlocProvider<PopularMoviesBloc>(
          create: (context) =>
              sl<PopularMoviesBloc>()..add(const GetPopularMoviesEvent()),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: AppRoutes.routes,
      theme: AppTheme.ligthTheme,
      title: 'Movies',
    );
  }
}
