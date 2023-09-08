import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/widgets/shimmer_list_view.dart';
import 'package:night_movie/features/movie/presentation/views/widgets/popular_list_view.dart';

import '../../../../../core/widgets/awesome_message.dart';
import '../../../data/models/movie_model/movie_model.dart';
import '../../model_views/popular_cubit/popular_movies_cubit.dart';

class PopularListViewBlocConsumer extends StatefulWidget {
  const PopularListViewBlocConsumer({Key? key}) : super(key: key);

  @override
  State<PopularListViewBlocConsumer> createState() =>
      _PopularListViewBlocConsumerState();
}

class _PopularListViewBlocConsumerState
    extends State<PopularListViewBlocConsumer> {
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
          return PopularListView(movies: movies);
        } else if (state is PopularMoviesFailure) {
          return AwesomeMessage(
            height: 140,
            message: state.error,
          );
        } else {
          //PopularMoviesLoading
          return const ShimmerListView();
        }
      },
    );
  }
}
