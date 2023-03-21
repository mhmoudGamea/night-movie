import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/features/movie/presentation/model_views/watch_list/watch_list_cubit.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_rate_widget.dart';
import './expanded_widget.dart';

class MovieMoreDetails extends StatelessWidget {
  final dynamic model; // this model could be MovieModel or RecommendationModel
  const MovieMoreDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<WatchListCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                child: Text(
                  model.title,
                  style: Styles.font17,
                ),
              ),
              BlocBuilder<WatchListCubit, WatchListState>(
                builder: (context, state) {
                  return IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () async {
                      BlocProvider.of<WatchListCubit>(context)
                          .watchList(model, context);
                    },
                    icon: Icon(
                      data.getIds.contains(model.id)
                          ? Icons.bookmark_rounded
                          : (state is WatchListSuccess
                              ? Icons.bookmark_rounded
                              : Icons.bookmark_outline_rounded),
                      size: 20,
                      color: primaryColor,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomRateWidget(date: model.releaseDate, rate: model.voteAverage),
          const SizedBox(height: 15),
          ExpandedWidget(overview: model.overview),
        ],
      ),
    );
  }
}
