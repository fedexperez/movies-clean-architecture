import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies/features/movies/presentation/blocs/movies/movies_bloc.dart';
import 'package:clean_architecture_movies/features/movies/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;

  const HomeScreen({
    super.key,
    required this.nowPlayingMovies,
    required this.popularMovies,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        final bloc = context.read<MoviesBloc>();
        return Scaffold(
            appBar: AppBar(
              title: const Text('Movie Box-Office'),
              actions: [
                IconButton(
                    // onPressed: (() => showSearch(
                    //     context: context, delegate: MovieSearchDelegate())),
                    onPressed: () {},
                    icon: const Icon(Icons.search)),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CardSwipper(movies: nowPlayingMovies),

                  //Row of movies
                  MovieSliderScreen(
                    title: 'Popular',
                    movies: popularMovies,
                    onNextPage: () {
                      print('nextpage no sirve');
                      return bloc.getPopularMovies;
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
