import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/movie_poster_image.dart';
import '../../../../../core/widgets/not_avilable_poster_image.dart';
import '../../../data/models/tv_model.dart';
import '../tv_details_view.dart';

class TvRecommendationGridView extends StatelessWidget {
  final List<TvModel> recommendations;
  const TvRecommendationGridView({Key? key, required this.recommendations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              .push(TvDetailsView.rn, extra: recommendations[index].id);
        },
        child: recommendations[index].backdropPath == null
            ? const NotAvilablePosterImage()
            : MoviePosterImage(
                imageUrl:
                    Helper.getImagePath(recommendations[index].backdropPath!)),
      ),
      itemCount: recommendations.length,
    );
  }
}
