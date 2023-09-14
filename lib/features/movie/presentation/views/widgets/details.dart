import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';

import 'movie_poster.dart';
import 'movie_trailer.dart';

class Details extends StatelessWidget {
  final MovieModel model;
  const Details({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      child: Stack(
        children: [
          // movie trailer video
          const MovieTrailer(),
          // poster + name, date, rate and geners
          Positioned(top: 130, left: 20, child: MoviePoster(model: model)),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_rounded,
                  size: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
