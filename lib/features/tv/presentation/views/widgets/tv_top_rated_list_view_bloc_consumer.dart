import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/tv/presentation/views/widgets/tv_top_rated_list_view.dart';

import '../../../../../core/widgets/awesome_message.dart';
import '../../../../../core/widgets/shimmer_list_view.dart';
import '../../../data/models/tv_model.dart';
import '../../model_views/tv_top_rated/tv_top_rated_cubit.dart';

class TvTopRatedListViewBlocConsumer extends StatefulWidget {
  const TvTopRatedListViewBlocConsumer({Key? key}) : super(key: key);

  @override
  State<TvTopRatedListViewBlocConsumer> createState() =>
      _TvTopRatedListViewBlocConsumerState();
}

class _TvTopRatedListViewBlocConsumerState
    extends State<TvTopRatedListViewBlocConsumer> {
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
          return TvTopRatedListView(tvs: tvs);
        } else if (state is TvTopRatedFailure) {
          return AwesomeMessage(height: 150, message: state.error);
        } else {
          return const ShimmerListView();
        }
      },
    );
  }
}
