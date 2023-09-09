import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/core/widgets/not_avilable_poster_image.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_top_rated/tv_top_rated_cubit.dart';
import 'package:night_movie/features/tv/presentation/views/tv_details_view.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/awesome_message.dart';
import '../../../../../core/widgets/movie_poster_image.dart';
import '../../../../../core/widgets/shimmer_list_view.dart';

class TvTopRatedListView extends StatelessWidget {
  const TvTopRatedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvTopRatedCubit, TvTopRatedState>(
      builder: (context, state) {
        if (state is TvTopRatedSuccess) {
          return SizedBox(
            height: 150,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.tvs.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(TvDetailsView.rn, extra: state.tvs[index].id);
                },
                child: state.tvs[index].backdropPath == null
                    ? const NotAvilablePosterImage()
                    : MoviePosterImage(
                        imageUrl: Helper.getImagePath(
                            state.tvs[index].backdropPath!)),
              ),
            ),
          );
        } else if (state is TvTopRatedFailure) {
          return AwesomeMessage(height: 150, message: state.error);
        } else {
          return const ShimmerListView();
        }
      },
    );
  }
}
