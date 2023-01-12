import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_movies/features/movies/presentation/blocs/movies/movies_bloc.dart';
import 'package:clean_architecture_movies/features/movies/presentation/screens/screens.dart';

class ScreenSelector extends StatelessWidget {
  const ScreenSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BuildBody();
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is LoadedMoviesState) {
          return HomeScreen(
            nowPlayingMovies: state.nowPlayingMovies,
            popularMovies: state.popularMovies,
          );
        } else {
          return const HomeScreen(nowPlayingMovies: [], popularMovies: []);
        }
      },
    );
  }
}
