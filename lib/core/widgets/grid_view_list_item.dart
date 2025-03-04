import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:night_movie/core/widgets/not_avilable_poster_image.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../features/tv/data/models/tv_model.dart';
import '../constants.dart';
import '../utils/helper.dart';
import '../utils/styles.dart';
import './shimmer_indicator.dart';

class GridViewListItem extends StatelessWidget {
  final dynamic model;
  const GridViewListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 31, 31, 33),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: model.backdropPath == null
                    ? const NotAvilablePosterImage(
                        width: double.infinity, height: 170)
                    : CachedNetworkImage(
                        imageUrl: Helper.getImagePath(model.backdropPath),
                        fit: BoxFit.cover,
                        height: 170,
                        placeholder: (context, url) => const ShimmerIndicator(
                            width: double.infinity, height: 170),
                      ),
              ),
              Positioned(
                bottom: -15,
                left: 5,
                child: Container(
                  height: 33,
                  width: 33,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 31, 31, 33),
                  ),
                  child: Center(
                    child: CircularPercentIndicator(
                      radius: 16.2,
                      lineWidth: 2.0,
                      percent: model.voteAverage / 10.0,
                      animation: true,
                      animationDuration: 1200,
                      center: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              Helper.changeNumberToFixedString(
                                rate: model.voteAverage,
                              ),
                              style:
                                  Styles.font14.copyWith(color: primaryColor),
                            ),
                            Text(
                              '%',
                              style: Styles.font13
                                  .copyWith(color: primaryColor, fontSize: 9),
                            )
                          ],
                        ),
                      ),
                      progressColor: Helper.percentIndicatorColor(
                          model.voteAverage)['progressColor'],
                      backgroundColor: Helper.percentIndicatorColor(
                          model.voteAverage)['backgroundColor']!,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding:
                const EdgeInsets.only(right: 5, left: 5, bottom: 5, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model is TvModel ? model.name : model.title,
                  style: Styles.font16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  model is TvModel
                      ? Helper.getWholeDate(model.firstAirDate)
                      : Helper.getWholeDate(model.releaseDate),
                  style: Styles.font13.copyWith(color: Colors.grey[500]!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
