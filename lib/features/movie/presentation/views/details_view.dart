import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/watch_list/data/repos/watch_repo_impl.dart';

import '../../../watch_list/presentation/view_models/watch_list/watch_list_cubit.dart';
import '../../data/repos/movie_repo_impl.dart';
import '../model_views/recommendation/recommendation_cubit.dart';
import '../model_views/trailer_cubit/trailer_cubit.dart';
import './widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  static const rn = '/detailsView';
  final dynamic model; // this model could be MovieModel or RecommendationModel
  const DetailsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecommendationCubit(MovieRepoImpl())
            ..fetchRecommendation(movieId: model.id),
        ),
        BlocProvider(
          create: (context) =>
              TrailerCubit(MovieRepoImpl())..fetchTrailer(movieId: model.id),
        ),
        BlocProvider(
          create: (context) => WatchListCubit(WatchRepoImpl()),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: DetailsViewBody(model: model),
        ),
      ),
    );
  }
}
