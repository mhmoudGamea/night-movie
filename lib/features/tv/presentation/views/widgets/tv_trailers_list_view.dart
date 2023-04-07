import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/widgets/shimmer_indicator.dart';
import 'package:night_movie/core/widgets/trailer_box.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_trailer_cubit/tv_trailer_cubit.dart';

class TvTrailersListView extends StatelessWidget {
  const TvTrailersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvTrailerCubit, TvTrailerState>(
      builder: (context, state) {
        if (state is TvTrailerFailure) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is TvTrailerSuccess) {
          return SizedBox(
            height: 140,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    TrailerBox(videoKey: state.trailers[index].key),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.trailers.length),
          );
        } else {
          return SizedBox(
            height: 140,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  const ShimmerIndicator(width: 220, height: 140),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: 5,
            ),
          );
        }
      },
    );
  }
}
