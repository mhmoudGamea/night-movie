import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/widgets/shimmer_indicator.dart';
import 'package:night_movie/features/movie/presentation/model_views/trailer_cubit/trailer_cubit.dart';

import 'trailer_box.dart';

class TrailersListView extends StatelessWidget {
  const TrailersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 140,
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerFailure) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is TrailerSuccess) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => TrailerBox(
                      videoKey: state.trailers[index].key,
                    ),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.trailers.length);
          } else {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    const ShimmerIndicator(width: 220, height: 140),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 5);
          }
        },
      ),
    );
  }
}
