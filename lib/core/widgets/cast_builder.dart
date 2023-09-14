import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/movie/presentation/model_views/cast_cubit/cast_cubit.dart';

import 'cast_list.dart';
import 'shimmer_cast.dart';

class CastBuilder extends StatelessWidget {
  const CastBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastSuccess) {
          return CastList(list: state.cast);
        } else if (state is CastFailure) {
          return Text(state.error);
        }
        return const ShimmerCast();
      },
    );
  }
}
