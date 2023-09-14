import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/custom_error_box.dart';
import '../../model_views/details/details_cubit.dart';
import 'outside_tabs_section.dart';
import 'tv_details.dart';

class TvDetailsViewBody extends StatelessWidget {
  const TvDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsSuccess) {
          // print(state.tvDetailModel.id);
          return Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 31, 31, 33),
                  Color.fromARGB(255, 15, 16, 17),
                ],
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TvDetails(model: state.tvDetailModel),
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
/*
state.tvDetailModel.backdropPath == null
                      ? const NotAvilablePosterImage()
                      : MoviePosterImageDetails(
                          imageUrl: Helper.getImagePath(
                              state.tvDetailModel.backdropPath!)),
                  const SizedBox(height: 18),
*/