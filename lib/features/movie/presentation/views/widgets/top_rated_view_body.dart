import 'package:flutter/material.dart';

import './top_rated_view_bloc_consumer.dart';

class TopRatedViewBody extends StatelessWidget {
  const TopRatedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 31, 31, 33),
            Color.fromARGB(255, 15, 16, 17),
          ],
        ),
      ),
      child: const TopRatedViewBlocConsumer(),
    );
  }
}
