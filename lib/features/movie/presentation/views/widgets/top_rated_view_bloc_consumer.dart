import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_box.dart';
import '../../../data/models/movie_model/movie_model.dart';
import '../../model_views/top_rated_cubit/top_rated_cubit.dart';
import 'top_rated_movie_grid_view_list.dart';

class TopRatedViewBlocConsumer extends StatefulWidget {
  const TopRatedViewBlocConsumer({Key? key}) : super(key: key);

  @override
  State<TopRatedViewBlocConsumer> createState() =>
      _TopRatedViewBlocConsumerState();
}

class _TopRatedViewBlocConsumerState extends State<TopRatedViewBlocConsumer> {
  List<MovieModel> movies = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopRatedCubit, TopRatedState>(
      listener: (context, state) {
        if (state is TopRatedMoviesSuccess) {
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is TopRatedMoviesSuccess ||
            state is TopRatedMoviesPaginationLoading) {
          return TopRatedMovieGridViewList(movies: movies);
        } else if (state is TopRatedMoviesFailure) {
          return CustomErrorBox(errorMessage: state.error);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
