import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:clean_architecture_movies/core/constants/constants.dart';
import 'package:clean_architecture_movies/core/router/app_routes.dart';
import 'package:clean_architecture_movies/core/ui/themes/app_theme.dart';
import 'package:clean_architecture_movies/features/language/presentation/bloc/language_bloc.dart';
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
          create: (context) => sl<PopularMoviesBloc>()
            ..add(const GetPopularMoviesEvent(popularMovies: [])),
        ),
        BlocProvider<LanguageBloc>(
          create: (context) => sl<LanguageBloc>()..add(CheckLanguageEvent()),
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
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        if (state is LanguageChangingState) {
          final Size size = MediaQuery.of(context).size;
          return Center(
            child: SizedBox(
              height: size.width * 0.4,
              width: size.width * 0.4,
              child: const CircularProgressIndicator(
                strokeWidth: 12,
              ),
            ),
          );
        }
        if (state is LanguageSetState) {
          return MaterialApp(
            locale: Locale(state.language.languageCode),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
            routes: AppRoutes.routes,
            theme: AppTheme.ligthTheme,
            title: 'Movies',
          );
        }
        if (state is LanguageErrorState) {
          print('TODO');
          return Container();
        } else {
          return MaterialApp(
            locale: Locale(
                sl<SharedPreferences>().getString(Constants.cachedLanguage) ??
                    'en'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
            routes: AppRoutes.routes,
            theme: AppTheme.ligthTheme,
            title: 'Movies',
          );
        }
      },
    );
  }
}
