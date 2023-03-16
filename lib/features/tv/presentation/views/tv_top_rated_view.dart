import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helper.dart';
import '../../data/repos/tv_repo_impl.dart';
import '../model_views/tv_top_rated/tv_top_rated_cubit.dart';
import 'widgets/tv_top_rated_view_body.dart';

class TvTopRatedView extends StatelessWidget {
  static const rn = '/tvTopRated';
  const TvTopRatedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TvTopRatedCubit(TvRepoImpl())..fetchTvTopRated(),
      child: Scaffold(
        appBar: Helper.appBarWidget(name: 'Top rated series', context: context),
        body: const SafeArea(
          child: TvTopRatedViewBody(),
        ),
      ),
    );
  }
}
