import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_box.dart';
import 'movie_grid_view_list.dart';
import '../../model_views/top_rated_cubit/top_rated_cubit.dart';

class TopRatedViewBody extends StatelessWidget {
  const TopRatedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 31, 31, 33),
            Color.fromARGB(255, 15, 16, 17),
          ],
        ),
      ),
      child: BlocBuilder<TopRatedCubit, TopRatedState>(
        builder: (context, state) {
          if (state is TopRatedMoviesSuccess) {
            return MovieGridViewList(model: state.movies);
          } else if (state is TopRatedMoviesFailure) {
            return CustomErrorBox(errorMessage: state.error);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
