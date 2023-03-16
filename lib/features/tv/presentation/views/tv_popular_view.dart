import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/utils/helper.dart';
import 'package:night_movie/features/tv/data/repos/tv_repo_impl.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_popular/tv_popular_cubit.dart';
import 'package:night_movie/features/tv/presentation/views/widgets/tv_popular_view_body.dart';

class TvPopularView extends StatelessWidget {
  static const rn = '/tvPopularView';
  const TvPopularView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TvPopularCubit(TvRepoImpl())..fetchTvPopular(),
      child: Scaffold(
        appBar: Helper.appBarWidget(name: 'Popular series', context: context),
        body: const SafeArea(
          child: TvPopularViewBody(),
        ),
      ),
    );
  }
}
