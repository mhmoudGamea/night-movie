import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_cast_cubit/tv_cast_cubit.dart';

import '../../../../../core/widgets/cast_list.dart';
import '../../../../../core/widgets/shimmer_cast.dart';

class TvCastBuilder extends StatelessWidget {
  const TvCastBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCastCubit, TvCastState>(
      builder: (context, state) {
        if (state is TvCastSuccess) {
          return CastList(list: state.cast);
        } else if (state is TvCastFailure) {
          return Text(state.error);
        }
        return const ShimmerCast();
      },
    );
  }
}
