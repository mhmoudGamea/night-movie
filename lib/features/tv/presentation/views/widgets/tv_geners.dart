import 'package:flutter/material.dart';
import 'package:night_movie/core/widgets/gener_box.dart';

import '../../../../../core/utils/helper.dart';

class TvGeners extends StatelessWidget {
  final List<Map<String, dynamic>> geners;
  const TvGeners({Key? key, required this.geners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myGeners = Helper.getTvGeners(geners);

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
