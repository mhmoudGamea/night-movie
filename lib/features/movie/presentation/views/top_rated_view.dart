import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper.dart';
import '../../data/repos/movie_repo_impl.dart';
import '../model_views/top_rated_cubit/top_rated_cubit.dart';
import 'widgets/top_rated_view_body.dart';

class TopRatedView extends StatelessWidget {
  static const rn = '/topRatedView';
  const TopRatedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TopRatedCubit(MovieRepoImpl())..fetchTopRatedMovies(),
      child: Scaffold(
        appBar: Helper.appBarWidget(name: 'Top rated movies', context: context),
        body: const SafeArea(
          child: TopRatedViewBody(),
        ),
      ),
    );
  }
}
