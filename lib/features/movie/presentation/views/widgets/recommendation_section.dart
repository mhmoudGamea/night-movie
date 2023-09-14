import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/core/widgets/not_avilable_poster_image.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/custom_error_box.dart';
import '../../../../../core/widgets/movie_tv_poster_image.dart';
import '../../model_views/recommendation/recommendation_cubit.dart';
import '../details_view.dart';
import 'section_details_header.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        if (state is RecommendationSuccess) {
          if (state.recommendations.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionDetailsHeader(
                    header: 'Recommendation', color: primaryColor),
                const SizedBox(height: 5),
                GridView.builder(
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
                      GoRouter.of(context).push(DetailsView.rn,
                          extra: state.recommendations[index]);
                    },
                    child: state.recommendations[index].backdropPath == null
                        ? const NotAvilablePosterImage()
                        : MovieTvPosterImage(
                            imageUrl: Helper.getImagePath(
                                state.recommendations[index].backdropPath!)),
                  ),
                  itemCount: state.recommendations.length,
                ),
              ],
            );
          }
          return const SizedBox();
        } else if (state is RecommendationFailure) {
          return CustomErrorBox(errorMessage: state.error);
        } else {
          return const SizedBox(height: 150);
        }
      },
    );
  }
}
