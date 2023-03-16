import 'package:flutter/material.dart';
import 'package:night_movie/core/utils/styles.dart';

import '../../../data/models/tv_episodes_model.dart';
import 'episode_item.dart';

class EpisodesList extends StatelessWidget {
  final List<TvEpisodeModel> tvs;
  const EpisodesList({Key? key, required this.tvs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tvs.isNotEmpty
        ? ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tvs.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) => EpisodeItem(episode: tvs[index]),
          )
        : const SizedBox(
            child:
                Text('The content is not available yet.', style: Styles.font13),
          );
  }
}
