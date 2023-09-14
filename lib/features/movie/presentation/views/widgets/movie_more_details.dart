import 'package:flutter/material.dart';

class MovieMoreDetails extends StatelessWidget {
  final dynamic model; // this model could be MovieModel or RecommendationModel
  const MovieMoreDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final data = BlocProvider.of<WatchListCubit>(context);
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 15),
          // ExpandedWidget(overview: model.overview),
        ],
      ),
    );
  }
}
