import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/tv/presentation/views/tv_details_view.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/awesome_message.dart';
import '../../../../../core/widgets/movie_poster_image.dart';
import '../../model_views/tv_popular/tv_popular_cubit.dart';

class TvPopularListView extends StatelessWidget {
  const TvPopularListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvPopularCubit, TvPopularState>(
      builder: (context, state) {
        if (state is TvPopularSuccess) {
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
                child: MoviePosterImage(
                    imageUrl: state.tvs[index].backdropPath == null
                        ? null
                        : Helper.getImagePath(state.tvs[index].backdropPath!)),
              ),
            ),
          );
        } else if (state is TvPopularFailure) {
          return AwesomeMessage(height: 150, message: state.error);
        } else {
          return const SizedBox(height: 150);
        }
      },
    );
  }
}
