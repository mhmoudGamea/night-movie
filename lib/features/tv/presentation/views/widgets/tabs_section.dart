import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/features/tv/presentation/model_views/details/details_cubit.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_episodes/tv_episodes_cubit.dart';

import '../../../../../core/utils/styles.dart';

class TabsSection extends StatelessWidget {
  const TabsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<TvEpisodesCubit>(context);
    return BlocBuilder<TvEpisodesCubit, TvEpisodesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    data.changeSeasonsTabValue();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 5, right: 5),
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      border: data.getSeasonsTabValue
                          ? const Border(
                              top: BorderSide(color: primaryColor, width: 2.5),
                            )
                          : null,
                    ),
                    child: const Text('Episodes', style: Styles.font15),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    data.changeMoreLikeThisTabValue(
                        tvId: BlocProvider.of<DetailsCubit>(context)
                            .getTvDetailModel
                            .id);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      border: data.getMoreLikeThisTabValue
                          ? const Border(
                              top: BorderSide(color: primaryColor, width: 2.5),
                            )
                          : null,
                    ),
                    child: const Text('More like this', style: Styles.font15),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
