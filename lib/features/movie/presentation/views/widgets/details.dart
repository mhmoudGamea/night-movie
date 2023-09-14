import 'package:flutter/material.dart';
import 'package:night_movie/core/utils/helper.dart';
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
          // poster + name, year, rate and geners
          Positioned(top: 130, left: 20, child: MoviePoster(model: model)),
          Positioned(top: 0, left: 0, child: Helper.iconBack(context: context)),
        ],
      ),
    );
  }
}
