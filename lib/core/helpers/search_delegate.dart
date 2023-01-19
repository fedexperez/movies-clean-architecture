import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_movies/features/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies/features/movies/presentation/blocs/search/search_bloc.dart';
import 'package:clean_architecture_movies/features/movies/presentation/widgets/message_display.dart';
import 'package:clean_architecture_movies/injection_container.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search Movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (query.isEmpty) {
      return _emptyContainer();
    }

    return BlocBuilder<SearchBloc, SearchState>(
      bloc: sl<SearchBloc>()..add(SearchMovieEvent(query: query)),
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return SizedBox(
            height: size.height * 0.5,
            width: size.width,
            child: Center(
              child: SizedBox(
                height: size.width * 0.4,
                width: size.width * 0.4,
                child: const CircularProgressIndicator(
                  strokeWidth: 12,
                ),
              ),
            ),
          );
        }
        if (state is SearchLoadedState) {
          return StreamBuilder(
            stream: state.movies,
            builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
              if (!snapshot.hasData) return _emptyContainer();

              final movies = snapshot.data!;

              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: ((context, index) {
                  return _MovieItem(movie: movies[index]);
                }),
              );
            },
          );
        }
        if (state is SearchErrorState) {
          return MessageDisplay(
            message: state.errorMessage,
            height: size.height * 0.6,
            width: size.width,
          );
        } else {
          return _emptyContainer();
        }
      },
    );
  }

  Widget _emptyContainer() {
    return Container(
      child: const Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.black38,
          size: 210,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (query.isEmpty) {
      return _emptyContainer();
    }

    return BlocBuilder<SearchBloc, SearchState>(
      bloc: sl<SearchBloc>()..add(SearchMovieEvent(query: query)),
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return SizedBox(
            height: size.height * 0.5,
            width: size.width,
            child: Center(
              child: SizedBox(
                height: size.width * 0.4,
                width: size.width * 0.4,
                child: const CircularProgressIndicator(
                  strokeWidth: 12,
                ),
              ),
            ),
          );
        }
        if (state is SearchLoadedState) {
          return StreamBuilder(
            stream: state.movies,
            builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
              if (!snapshot.hasData) return _emptyContainer();

              final movies = snapshot.data!;

              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: ((context, index) {
                  return _MovieItem(movie: movies[index]);
                }),
              );
            },
          );
        }
        if (state is SearchErrorState) {
          return MessageDisplay(
            message: state.errorMessage,
            height: size.height * 0.6,
            width: size.width,
          );
        } else {
          return _emptyContainer();
        }
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/circle-loader.gif'),
          image: NetworkImage(movie.posterPath!),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: (() {
        Navigator.pushNamed(context, 'details', arguments: movie);
      }),
    );
  }
}
