import 'package:flutter/material.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/core/widgets/not_avilable_poster_image.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';
import 'package:night_movie/features/movie/presentation/views/widgets/section_details_header.dart';
import 'package:night_movie/features/movie/presentation/views/widgets/trailers_list_view.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/cast_builder.dart';
import './movie_more_details.dart';
import './movie_poster_image_details.dart';
import './recommendation_section.dart';

class DetailsViewBody extends StatelessWidget {
  final MovieModel
      model; // this model could be MovieModel or RecommendationModel
  const DetailsViewBody({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            model.backdropPath == null
                ? const NotAvilablePosterImage(
                    width: double.infinity, height: 230)
                : MoviePosterImageDetails(
                    imageUrl: Helper.getImagePath(model.backdropPath!)),
            const SizedBox(height: 20),
            const TrailersListView(),
            const SizedBox(height: 20),
            MovieMoreDetails(model: model),
            const SizedBox(height: 15),
            const SectionDetailsHeader(header: 'Cast', color: primaryColor),
            const SizedBox(height: 5),
            const CastBuilder(),
            const SizedBox(height: 5),
            const SectionDetailsHeader(
                header: 'Recommendation', color: primaryColor),
            const SizedBox(height: 5),
            const RecommendationSection(),
          ],
        ),
      ),
    );
  }
}
