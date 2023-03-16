import 'package:flutter/material.dart';
import 'package:night_movie/features/tv/presentation/views/widgets/tv_popular_section.dart';
import 'package:night_movie/features/tv/presentation/views/widgets/tv_top_rated_section.dart';

import './tv_on_the_air_section.dart';

class TvViewBody extends StatelessWidget {
  const TvViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: const [
          SizedBox(height: 5),
          TvOnTheAirSection(),
          SizedBox(height: 30),
          TvPopularSection(),
          SizedBox(height: 30),
          TvTopRatedSection(),
        ],
      ),
    );
  }
}
