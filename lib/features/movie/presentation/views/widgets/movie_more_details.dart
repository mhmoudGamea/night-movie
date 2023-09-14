import 'package:flutter/material.dart';
import 'package:night_movie/features/movie/presentation/views/widgets/title_widget.dart';

import '../../../../../core/widgets/custom_rate_widget.dart';
import 'movie_gener_generated.dart';

class MovieMoreDetails extends StatelessWidget {
  final dynamic model; // this model could be MovieModel or RecommendationModel
  const MovieMoreDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final data = BlocProvider.of<WatchListCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(model: model),
          const SizedBox(height: 10),
          CustomRateWidget(date: model.releaseDate, rate: model.voteAverage),
          const SizedBox(height: 15),
          MovieGenerGenerated(geners: model.generIds),
          // const SizedBox(height: 15),
          // ExpandedWidget(overview: model.overview),
        ],
      ),
    );
  }
}
