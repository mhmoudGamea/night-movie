import 'package:flutter/material.dart';
import 'package:night_movie/core/widgets/gener_box.dart';

import '../../../../../core/utils/helper.dart';

class TvGenerGenerated extends StatelessWidget {
  final List<Map<String, dynamic>> geners;
  const TvGenerGenerated({Key? key, required this.geners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myGeners = Helper.getTvGeners(geners);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 35,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: myGeners.length,
                separatorBuilder: (context, index) => const SizedBox(width: 5),
                itemBuilder: (context, index) =>
                    GenerBox(text: myGeners[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
