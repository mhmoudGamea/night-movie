import 'package:flutter/material.dart';

import 'now_playing_section.dart';
import 'popular_section.dart';
import 'top_rated_section.dart';

class MovieViewBody extends StatelessWidget {
  const MovieViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 5),
          NowPlayingSection(),
          SizedBox(height: 30),
          PopularSection(),
          SizedBox(height: 30),
          TopRatedSection(),
        ],
      ),
    );
  }
}
