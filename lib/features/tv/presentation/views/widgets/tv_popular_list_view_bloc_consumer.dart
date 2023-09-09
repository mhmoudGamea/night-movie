import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/tv/presentation/views/widgets/tv_popular_list_view.dart';

import '../../../../../core/widgets/awesome_message.dart';
import '../../../../../core/widgets/shimmer_list_view.dart';
import '../../../data/models/tv_model.dart';
import '../../model_views/tv_popular/tv_popular_cubit.dart';

class TvPopularListViewBlocConsumer extends StatefulWidget {
  const TvPopularListViewBlocConsumer({Key? key}) : super(key: key);

  @override
  State<TvPopularListViewBlocConsumer> createState() =>
      _TvPopularListViewBlocConsumerState();
}

class _TvPopularListViewBlocConsumerState
    extends State<TvPopularListViewBlocConsumer> {
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
          return TvPopularListView(tvs: tvs);
        } else if (state is TvPopularFailure) {
          return AwesomeMessage(height: 150, message: state.error);
        } else {
          return const ShimmerListView();
        }
      },
    );
  }
}
