import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/awesome_message.dart';
import '../../../../../core/widgets/movie_poster_image.dart';
import '../../../../../core/widgets/not_avilable_poster_image.dart';
import '../../model_views/top_rated_cubit/top_rated_cubit.dart';
import '../details_view.dart';

class TopRatedListView extends StatelessWidget {
  const TopRatedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        if (state is TopRatedMoviesSuccess) {
          return SizedBox(
            height: 150,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(DetailsView.rn, extra: state.movies[index]);
                },
                child: state.movies[index].backdropPath == null
                    ? const NotAvilablePosterImage()
                    : MoviePosterImage(
                        imageUrl: Helper.getImagePath(
                            state.movies[index].backdropPath!)),
              ),
            ),
          );
        } else if (state is TopRatedMoviesFailure) {
          return AwesomeMessage(
            height: 140,
            message: state.error,
          );
        } else {
          return const SizedBox(height: 150);
        }
      },
    );
  }
}
