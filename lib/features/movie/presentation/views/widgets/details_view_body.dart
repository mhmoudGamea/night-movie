import 'package:flutter/material.dart';
import 'package:night_movie/features/movie/presentation/views/widgets/trailers_list_view.dart';

import '../../../../../core/utils/helper.dart';
import 'movie_gener_generated.dart';
import './movie_more_details.dart';
import './movie_poster_image_details.dart';
import './recommendation_section.dart';

class DetailsViewBody extends StatelessWidget {
  final dynamic model; // this model could be MovieModel or RecommendationModel
  const DetailsViewBody({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(model.id);
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 31, 31, 33),
            Color.fromARGB(255, 15, 16, 17),
          ],
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePosterImageDetails(
                imageUrl: model.backdropPath == null
                    ? null
                    : Helper.getImagePath(model.backdropPath)),
            const SizedBox(height: 20),
            const TrailersListView(),
            const SizedBox(height: 20),
            MovieMoreDetails(model: model),
            const SizedBox(height: 10),
            MovieGenerGenerated(geners: model.generIds),
            const SizedBox(height: 20),
            const RecommendationSection(),
          ],
        ),
      ),
    );
  }
}
