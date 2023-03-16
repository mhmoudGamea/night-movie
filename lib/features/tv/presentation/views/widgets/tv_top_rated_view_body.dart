import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_box.dart';
import '../../model_views/tv_top_rated/tv_top_rated_cubit.dart';
import 'tv_grid_view_list.dart';

class TvTopRatedViewBody extends StatelessWidget {
  const TvTopRatedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 31, 31, 33),
              Color.fromARGB(255, 15, 16, 17),
            ]),
      ),
      child: BlocBuilder<TvTopRatedCubit, TvTopRatedState>(
        builder: (context, state) {
          if (state is TvTopRatedSuccess) {
            return TvGridViewList(model: state.tvs);
          } else if (state is TvTopRatedFailure) {
            return CustomErrorBox(errorMessage: state.error);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
