import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_box.dart';
import '../../../data/models/movie_model/movie_model.dart';
import '../../model_views/popular_cubit/popular_movies_cubit.dart';
import './popular_movie_grid_view_list.dart';

class PopularViewBlocConsumer extends StatefulWidget {
  const PopularViewBlocConsumer({Key? key}) : super(key: key);

  @override
  State<PopularViewBlocConsumer> createState() =>
      _PopularViewBlocConsumerState();
}

class _PopularViewBlocConsumerState extends State<PopularViewBlocConsumer> {
  List<MovieModel> movies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularMoviesCubit, PopularMoviesState>(
      listener: (context, state) {
        if (state is PopularMoviesSuccess) {
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is PopularMoviesSuccess ||
            state is PopularMoviesPaginationLoading) {
          return PopularMovieGridViewList(movies: movies);
        } else if (state is PopularMoviesFailure) {
          return CustomErrorBox(errorMessage: state.error);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
