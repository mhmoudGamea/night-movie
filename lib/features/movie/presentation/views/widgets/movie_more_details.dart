import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_rate_widget.dart';
import './expanded_widget.dart';

class MovieMoreDetails extends StatelessWidget {
  final dynamic model; // this model could be MovieModel or RecommendationModel
  const MovieMoreDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              model.title,
              style: Styles.font17.copyWith(
                letterSpacing: 1.5,
              ),
            ),
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
