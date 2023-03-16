import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/movie_repo_impl.dart';
import '../model_views/now_playing_cubit/now_playing_cubit.dart';
import '../model_views/popular_cubit/popular_movies_cubit.dart';
import '../model_views/top_rated_cubit/top_rated_cubit.dart';
import 'widgets/movie_view_body.dart';

class MovieView extends StatelessWidget {
  static const rn = '/movieView';
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NowPlayingCubit(MovieRepoImpl())..fetchNowPlaying(),
        ),
        BlocProvider(
          create: (context) =>
              PopularMoviesCubit(MovieRepoImpl())..fetchPopularMovies(),
        ),
        BlocProvider(
          create: (context) =>
              TopRatedCubit(MovieRepoImpl())..fetchTopRatedMovies(),
        ),
      ],
      child: const SafeArea(
        child: MovieViewBody(),
      ),
    );
  }
}
