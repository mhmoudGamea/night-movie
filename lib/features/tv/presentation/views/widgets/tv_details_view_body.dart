import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/utils/helper.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/custom_error_box.dart';
import '../../model_views/details/details_cubit.dart';
import 'episodes_recommended_tabs.dart';
import 'tv_cast_builder.dart';
import 'tv_description.dart';
import 'tv_details.dart';

class TvDetailsViewBody extends StatelessWidget {
  const TvDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsSuccess) {
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: Helper.getLinearGradiant(),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TvDetails(model: state.tvDetailModel),
                  TvDescription(overview: state.tvDetailModel.overview),
                  const TvCastBuilder(),
                  const SizedBox(height: 5),
                  EpisodesRecommendedTabs(
                    tvId: state.tvDetailModel.id,
                    numberOfSeasons: state.tvDetailModel.numberOfSeasons,
                  ),
                ],
              ),
            ),
          );
        } else if (state is DetailsFailure) {
          return CustomErrorBox(errorMessage: state.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator(color: primaryColor),
          );
        }
      },
    );
  }
}
