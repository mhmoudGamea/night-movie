import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_box.dart';
import '../../model_views/tv_popular/tv_popular_cubit.dart';
import 'tv_grid_view_list.dart';

class TvPopularViewBody extends StatelessWidget {
  const TvPopularViewBody({Key? key}) : super(key: key);

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
      child: BlocBuilder<TvPopularCubit, TvPopularState>(
        builder: (context, state) {
          if (state is TvPopularSuccess) {
            return TvGridViewList(model: state.tvs);
          } else if (state is TvPopularFailure) {
            return CustomErrorBox(errorMessage: state.error);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
