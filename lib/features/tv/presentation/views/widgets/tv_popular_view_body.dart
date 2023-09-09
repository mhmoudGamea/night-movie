import 'package:flutter/material.dart';

import 'tv_popular_view_body_bloc_consumer.dart';

class TvPopularViewBody extends StatelessWidget {
  const TvPopularViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 31, 31, 33),
              Color.fromARGB(255, 15, 16, 17),
            ]),
      ),
      child: const TvPopularViewBodyBlocConsumer(),
    );
  }
}
