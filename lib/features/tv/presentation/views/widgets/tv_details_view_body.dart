import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/tv/presentation/views/widgets/tv_trailers_list_view.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/custom_error_box.dart';
import '../../../../movie/presentation/views/widgets/movie_poster_image_details.dart';
import '../../model_views/details/details_cubit.dart';
import 'outside_tabs_section.dart';
import 'tv_gener_generated.dart';
import 'tv_more_details.dart';

class TvDetailsViewBody extends StatelessWidget {
  const TvDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsSuccess) {
          print(state.tvDetailModel.id);
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
                  MoviePosterImageDetails(
                      imageUrl: state.tvDetailModel.backdropPath == null
                          ? null
                          : Helper.getImagePath(
                              state.tvDetailModel.backdropPath!)),
                  const SizedBox(height: 18),
                  const TvTrailersListView(),
                  const SizedBox(height: 18),
                  TvMoreDetails(model: state.tvDetailModel),
                  const SizedBox(height: 10),
                  TvGenerGenerated(geners: state.tvDetailModel.geners),
                  const SizedBox(height: 10),
                  OutsideTabsSection(
                    tvId: state.tvDetailModel.id,
                    numberOfSeasons: state.tvDetailModel.numberOfSeasons,
                  ),
                  //SkeltonBody(),
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
