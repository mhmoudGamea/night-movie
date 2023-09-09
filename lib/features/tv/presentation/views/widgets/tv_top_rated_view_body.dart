import 'package:flutter/material.dart';

import 'tv_top_rated_view_body_bloc_consumer.dart';

class TvTopRatedViewBody extends StatelessWidget {
  const TvTopRatedViewBody({Key? key}) : super(key: key);

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
      child: const TvTopRatedViewBodyBlocConsumer(),
    );
  }
}
