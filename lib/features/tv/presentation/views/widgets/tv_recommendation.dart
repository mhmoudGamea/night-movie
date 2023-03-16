import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_episodes/tv_episodes_cubit.dart';
import 'package:night_movie/features/tv/presentation/views/tv_details_view.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/custom_error_box.dart';
import '../../../../../core/widgets/movie_poster_image.dart';

class TvRecommendation extends StatelessWidget {
  const TvRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvEpisodesCubit, TvEpisodesState>(
      builder: (context, state) {
        if (state is TvRecommendationSuccess) {
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
                GoRouter.of(context).push(TvDetailsView.rn,
                    extra: state.recommendations[index].id);
              },
              child: MoviePosterImage(
                  imageUrl: state.recommendations[index].backdropPath == null
                      ? null
                      : Helper.getImagePath(
                          state.recommendations[index].backdropPath!)),
            ),
            itemCount: state.recommendations.length,
          );
        } else if (state is TvRecommendationFailure) {
          return CustomErrorBox(errorMessage: state.error);
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }
      },
    );
  }
}
