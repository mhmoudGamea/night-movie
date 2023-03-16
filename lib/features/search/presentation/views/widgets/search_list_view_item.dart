import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:night_movie/core/widgets/not_avilable_poster_image.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_rate_widget.dart';
import '../../../../../core/widgets/shimmer_indicator.dart';
import '../../../data/models/search_model/search_model.dart';

class SearchListViewItem extends StatelessWidget {
  final SearchModel searchedMovie;
  const SearchListViewItem({Key? key, required this.searchedMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primarySecondDark,
      ),
      child: Row(
        children: [
          searchedMovie.backdropPath == null
              ? const NotAvilablePosterImage(
                  height: 140,
                  width: 100,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: Helper.getImagePath(searchedMovie.backdropPath!),
                    fit: BoxFit.cover,
                    width: 100,
                    height: 140,
                    placeholder: (context, url) =>
                        const ShimmerIndicator(width: 100, height: 140),
                  ),
                ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(searchedMovie.title,
                    style: Styles.font17,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                const SizedBox(height: 8),
                CustomRateWidget(
                  date: searchedMovie.releaseDate,
                  rate: searchedMovie.voteAverage,
                ),
                const SizedBox(height: 8),
                Text(
                  searchedMovie.overview,
                  style: Styles.font14,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
