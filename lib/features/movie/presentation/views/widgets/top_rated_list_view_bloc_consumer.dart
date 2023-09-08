import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/movie/presentation/views/widgets/top_rated_list_view.dart';

import '../../../../../core/widgets/awesome_message.dart';
import '../../../../../core/widgets/shimmer_list_view.dart';
import '../../../data/models/movie_model/movie_model.dart';
import '../../model_views/top_rated_cubit/top_rated_cubit.dart';

class TopRatedListViewBlocConsumer extends StatefulWidget {
  const TopRatedListViewBlocConsumer({Key? key}) : super(key: key);

  @override
  State<TopRatedListViewBlocConsumer> createState() =>
      _TopRatedListViewBlocConsumerState();
}

class _TopRatedListViewBlocConsumerState
    extends State<TopRatedListViewBlocConsumer> {
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
          return TopRatedListView(movies: movies);
        } else if (state is TopRatedMoviesFailure) {
          return AwesomeMessage(
            height: 140,
            message: state.error,
          );
        } else {
          //TopRatedMoviesLoading
          return const ShimmerListView();
        }
      },
    );
  }
}
