import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_movies/features/movies/presentation/widgets/message_display.dart';
import 'package:clean_architecture_movies/features/movies/domain/entities/cast.dart';
import 'package:clean_architecture_movies/features/movies/presentation/blocs/cast/cast_bloc.dart';
import 'package:clean_architecture_movies/injection_container.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      bloc: sl<CastBloc>()..add(GetCastEvent(movieId: movieId)),
      builder: (context, state) {
        if (state is CastLoadedState) {
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 190,
            child: ListView.builder(
              itemCount: state.castList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return _CastCard(
                  actor: state.castList[index],
                );
              },
            ),
          );
        }
        if (state is CastErrorState) {
          return MessageDisplay(
            message: state.errorMessage,
            height: 190,
            width: double.infinity,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({required this.actor});

  final Cast actor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/circle-loader.gif'),
              image: NetworkImage(actor.profilePath!),
              height: 150,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
