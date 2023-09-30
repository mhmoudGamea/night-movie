import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/widgets/shimmer_indicator.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_trailer_cubit/tv_trailer_cubit.dart';

class TvTrailer extends StatelessWidget {
  const TvTrailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trailer = BlocProvider.of<TvTrailerCubit>(context);
    return BlocBuilder<TvTrailerCubit, TvTrailerState>(
      builder: (context, state) {
        if (state is TvTrailerFailure) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is TvTrailerSuccess) {
          return trailer.showTrailer(trailers: state.trailers, type: 'Tv');
        } else {
          return const ShimmerIndicator(width: double.infinity, height: 150);
        }
      },
    );
  }
}
