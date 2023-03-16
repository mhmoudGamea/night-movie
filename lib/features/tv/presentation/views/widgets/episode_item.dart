import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/not_avilable_poster_image.dart';
import '../../../../../core/widgets/shimmer_indicator.dart';
import '../../../data/models/tv_episodes_model.dart';

class EpisodeItem extends StatelessWidget {
  final TvEpisodeModel episode;
  const EpisodeItem({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: episode.stillPath == null
                  ? const NotAvilablePosterImage(height: 100, width: 150)
                  : CachedNetworkImage(
                      imageUrl: Helper.getImagePath(episode.stillPath!),
                      fit: BoxFit.cover,
                      height: 100,
                      width: 150,
                      placeholder: (context, url) =>
                          const ShimmerIndicator(width: 150, height: 100),
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    episode.name,
                    style: Styles.font16,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Text(Helper.getWholeDate(episode.airDate),
                      style: Styles.font13.copyWith(color: Colors.grey[500])),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Wrap(
          children: [
            Text(
              episode.overview,
              style: Styles.font13.copyWith(color: Colors.grey[500]),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ],
    );
  }
}
