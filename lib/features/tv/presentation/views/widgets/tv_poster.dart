import 'package:flutter/material.dart';
import 'package:night_movie/core/widgets/movie_tv_poster_image.dart';
import 'package:night_movie/features/tv/data/models/tv_detail_model.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/custom_rate_widget.dart';
import '../../../../../core/widgets/not_avilable_poster_image.dart';
import 'tv_geners.dart';
import 'tv_title.dart';

class TvPoster extends StatelessWidget {
  final TvDetailModel model;
  const TvPoster({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        model.backdropPath == null
            ? const NotAvilablePosterImage(width: 97.5, height: 150)
            : MovieTvPosterImage(
                imageUrl: Helper.getImagePath(model.backdropPath!),
              ),
        const SizedBox(width: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width - (20 + 97.5 + 15 + 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 55),
              TvTitle(model: model),
              const SizedBox(height: 10),
              CustomRateWidget(
                  date: model.firstAirDate,
                  rate: model.voteAverage,
                  numberOfSeasons: model.numberOfSeasons),
              const SizedBox(height: 10),
              TvGeners(geners: model.geners),
            ],
          ),
        )
      ],
    );
  }
}
