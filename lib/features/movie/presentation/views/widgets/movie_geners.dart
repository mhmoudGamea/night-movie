import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/gener_box.dart';

class MovieGeners extends StatelessWidget {
  final List<dynamic>? geners;
  const MovieGeners({Key? key, required this.geners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myGeners = Helper.getMovieGeners(geners);
    return SizedBox(
      height: 35,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: myGeners.length,
              separatorBuilder: (context, index) => Helper.generSeparate(),
              itemBuilder: (context, index) => GenerBox(text: myGeners[index]),
            ),
          )
        ],
      ),
    );
  }
}
