import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/tv/data/repos/tv_repo_impl.dart';
import 'package:night_movie/features/tv/presentation/model_views/on_the_air/on_the_air_cubit.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_popular/tv_popular_cubit.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_top_rated/tv_top_rated_cubit.dart';

import './widgets/tv_view_body.dart';

class TvView extends StatelessWidget {
  const TvView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (index) => OnTheAirCubit(TvRepoImpl())..fetchOnTheAir(),
        ),
        BlocProvider(
          create: (index) => TvPopularCubit(TvRepoImpl())..fetchTvPopular(),
        ),
        BlocProvider(
          create: (index) => TvTopRatedCubit(TvRepoImpl())..fetchTvTopRated(),
        ),
      ],
      child: const SafeArea(
        child: TvViewBody(),
      ),
    );
  }
}
