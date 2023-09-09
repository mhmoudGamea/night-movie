import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/widgets/shimmer_grid_view_2_.dart';

import '../../../../../core/widgets/custom_error_box.dart';
import '../../../data/models/tv_model.dart';
import '../../model_views/tv_top_rated/tv_top_rated_cubit.dart';
import 'tv_top_rated_grid_view_list.dart';

class TvTopRatedViewBodyBlocConsumer extends StatefulWidget {
  const TvTopRatedViewBodyBlocConsumer({Key? key}) : super(key: key);

  @override
  State<TvTopRatedViewBodyBlocConsumer> createState() =>
      _TvTopRatedViewBodyBlocConsumerState();
}

class _TvTopRatedViewBodyBlocConsumerState
    extends State<TvTopRatedViewBodyBlocConsumer> {
  List<TvModel> tvs = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvTopRatedCubit, TvTopRatedState>(
      listener: (context, state) {
        if (state is TvTopRatedSuccess) {
          tvs.addAll(state.tvs);
        }
      },
      builder: (context, state) {
        if (state is TvTopRatedSuccess ||
            state is TvTopRatedPaginationLoading) {
          return TvTopRatedGridViewList(model: tvs);
        } else if (state is TvTopRatedFailure) {
          return CustomErrorBox(errorMessage: state.error);
        } else {
          return const ShimmerGridView2();
        }
      },
    );
  }
}
