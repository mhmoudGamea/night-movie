import 'package:flutter/material.dart';
import 'package:night_movie/core/utils/helper.dart';
import 'package:night_movie/core/widgets/movie_poster_image.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';

import '../../../../../core/widgets/custom_rate_widget.dart';
import '../../../../../core/widgets/not_avilable_poster_image.dart';
import 'movie_gener_generated.dart';
import 'title_widget.dart';

class MoviePoster extends StatelessWidget {
  final MovieModel model;
  const MoviePoster({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        model.backdropPath == null
            ? const NotAvilablePosterImage(width: 97.5, height: 150)
            : MoviePosterImage(
                imageUrl: Helper.getImagePath(model.backdropPath!),
              ),
        const SizedBox(width: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width - (20 + 97.5 + 15 + 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 55),
              TitleWidget(model: model),
              const SizedBox(height: 10),
              CustomRateWidget(
                  date: model.releaseDate, rate: model.voteAverage),
              const SizedBox(height: 10),
              MovieGenerGenerated(geners: model.generIds),
            ],
          ),
        )
      ],
    );
  }
}
