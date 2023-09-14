import 'package:flutter/material.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';
import 'package:night_movie/features/movie/presentation/views/widgets/section_details_header.dart';

import '../../../../../core/widgets/cast_builder.dart';
import './recommendation_section.dart';
import 'details.dart';

class DetailsViewBody extends StatelessWidget {
  final MovieModel model;
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
            Details(model: model),
            const SizedBox(height: 10),
            // MovieMoreDetails(model: model),
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
/*
model.backdropPath == null
                ? const NotAvilablePosterImage(
                    width: double.infinity, height: 230)
                : MoviePosterImageDetails(
                    imageUrl: Helper.getImagePath(model.backdropPath!)),
            const SizedBox(height: 20),

*/