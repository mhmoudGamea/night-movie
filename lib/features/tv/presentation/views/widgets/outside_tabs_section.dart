import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_episodes/tv_episodes_cubit.dart';
import 'package:night_movie/features/tv/presentation/views/widgets/tv_recommendation.dart';

import 'seasons_list.dart';
import 'tabs_section.dart';

class EpisodesRecommendedTabs extends StatelessWidget {
  final int tvId;
  final int numberOfSeasons;
  const EpisodesRecommendedTabs(
      {Key? key, required this.tvId, required this.numberOfSeasons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<TvEpisodesCubit>(context);
    return BlocBuilder<TvEpisodesCubit, TvEpisodesState>(
      builder: (context, state) {
        return Column(
          children: [
            const TabsSection(),
            const SizedBox(height: 10),
            if (data.getSeasonsTabValue)
              SeasonsList(tvId: tvId, numberOfSeasons: numberOfSeasons),
            if (data.getMoreLikeThisTabValue) const TvRecommendation(),
          ],
        );
      },
    );
  }
}
