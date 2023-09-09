import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_box.dart';
import '../../../../../core/widgets/shimmer_grid_view_2_.dart';
import '../../../data/models/tv_model.dart';
import '../../model_views/tv_popular/tv_popular_cubit.dart';
import 'tv_popular_grid_view_list.dart';

class TvPopularViewBodyBlocConsumer extends StatefulWidget {
  const TvPopularViewBodyBlocConsumer({Key? key}) : super(key: key);

  @override
  State<TvPopularViewBodyBlocConsumer> createState() =>
      _TvPopularViewBodyBlocConsumerState();
}

class _TvPopularViewBodyBlocConsumerState
    extends State<TvPopularViewBodyBlocConsumer> {
  List<TvModel> tvs = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvPopularCubit, TvPopularState>(
      listener: (context, state) {
        if (state is TvPopularSuccess) {
          tvs.addAll(state.tvs);
        }
      },
      builder: (context, state) {
        if (state is TvPopularSuccess || state is TvPopularPaginationLoading) {
          return TvPopularGridViewList(model: tvs);
        } else if (state is TvPopularFailure) {
          return CustomErrorBox(errorMessage: state.error);
        } else {
          return const ShimmerGridView2();
        }
      },
    );
  }
}
