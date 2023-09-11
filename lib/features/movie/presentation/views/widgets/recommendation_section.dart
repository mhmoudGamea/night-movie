import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/core/widgets/not_avilable_poster_image.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/custom_error_box.dart';
import '../../../../../core/widgets/movie_poster_image.dart';
import '../../model_views/recommendation/recommendation_cubit.dart';
import '../details_view.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        if (state is RecommendationSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.6 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .push(DetailsView.rn, extra: state.recommendations[index]);
              },
              child: state.recommendations[index].backdropPath == null
                  ? const NotAvilablePosterImage()
                  : MoviePosterImage(
                      imageUrl: Helper.getImagePath(
                          state.recommendations[index].backdropPath!)),
            ),
            itemCount: state.recommendations.length,
          );
        } else if (state is RecommendationFailure) {
          return CustomErrorBox(errorMessage: state.error);
        } else {
          return const SizedBox(height: 150);
        }
      },
    );
  }
}
