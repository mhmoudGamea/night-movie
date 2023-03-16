import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_episodes/tv_episodes_cubit.dart';

import '../../data/repos/tv_repo_impl.dart';
import '../model_views/details/details_cubit.dart';
import 'widgets/tv_details_view_body.dart';

class TvDetailsView extends StatelessWidget {
  static const rn = '/tvDetailsView';
  final int tvSeriesId;
  const TvDetailsView({Key? key, required this.tvSeriesId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              DetailsCubit(TvRepoImpl())..fetchDetails(tvSeriesId),
        ),
        BlocProvider(
          create: (context) => TvEpisodesCubit(TvRepoImpl()),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: TvDetailsViewBody(),
        ),
      ),
    );
  }
}
/*


*/