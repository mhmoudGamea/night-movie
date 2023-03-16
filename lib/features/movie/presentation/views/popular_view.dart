import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper.dart';
import '../../data/repos/movie_repo_impl.dart';
import '../model_views/popular_cubit/popular_movies_cubit.dart';
import './widgets/popular_view_body.dart';

class PopularView extends StatelessWidget {
  static const rn = '/popularView';
  const PopularView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PopularMoviesCubit(MovieRepoImpl())..fetchPopularMovies(),
      child: Scaffold(
        appBar: Helper.appBarWidget(name: 'Popular movies', context: context),
        body: const SafeArea(
          child: PopularViewBody(),
        ),
      ),
    );
  }
}
