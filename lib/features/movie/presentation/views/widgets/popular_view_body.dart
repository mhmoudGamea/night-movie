import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';
import '../../../../../core/widgets/custom_error_box.dart';
import '../../../../../core/widgets/grid_view_list.dart';
import '../../model_views/popular_cubit/popular_movies_cubit.dart';

class PopularViewBody extends StatelessWidget {
  const PopularViewBody({Key? key}) : super(key: key);

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
            ]),
      ),
      child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        builder: (context, state) {
          if (state is PopularMoviesSuccess) {
            return GridViewList<MovieModel>(model: state.movies);
          } else if (state is PopularMoviesFailure) {
            return CustomErrorBox(errorMessage: state.error);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
