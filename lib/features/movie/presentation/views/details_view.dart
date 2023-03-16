import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/movie_repo_impl.dart';
import '../model_views/recommendation/recommendation_cubit.dart';
import './widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  static const rn = '/detailsView';
  final dynamic model; // this model could be MovieModel or RecommendationModel
  const DetailsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendationCubit(MovieRepoImpl())
        ..fetchRecommendation(movieId: model.id),
      child: Scaffold(
        body: SafeArea(
          child: DetailsViewBody(model: model),
        ),
      ),
    );
  }
}
