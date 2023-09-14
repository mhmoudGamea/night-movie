import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/widgets/shimmer_indicator.dart';
import 'package:night_movie/features/movie/presentation/model_views/trailer_cubit/trailer_cubit.dart';

class TrailersListView extends StatelessWidget {
  const TrailersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trailer = BlocProvider.of<TrailerCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerFailure) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is TrailerSuccess) {
            return trailer.showTrailer(trailers: state.trailers, type: 'Movie');
          } else {
            return const ShimmerIndicator(width: double.infinity, height: 150);
          }
        },
      ),
    );
  }
}
