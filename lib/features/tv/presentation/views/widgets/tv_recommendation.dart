import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/widgets/shimmer_grid_view_3.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_episodes/tv_episodes_cubit.dart';

import '../../../../../core/widgets/custom_error_box.dart';
import 'tv_recommendation_grid_view.dart';

class TvRecommendation extends StatelessWidget {
  const TvRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvEpisodesCubit, TvEpisodesState>(
      builder: (context, state) {
        if (state is TvRecommendationSuccess) {
          return TvRecommendationGridView(
              recommendations: state.recommendations);
        } else if (state is TvRecommendationFailure) {
          return CustomErrorBox(errorMessage: state.error);
        } else {
          return const ShimmerGridView3();
        }
      },
    );
  }
}
