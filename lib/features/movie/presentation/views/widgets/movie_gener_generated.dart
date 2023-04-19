import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/gener_box.dart';

class MovieGenerGenerated extends StatelessWidget {
  final List<dynamic>? geners;
  const MovieGenerGenerated({Key? key, required this.geners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myGeners = Helper.getMovieGeners(geners);
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
/*

Text(
                  myGeners[index],
                  style: Styles.font13.copyWith(color: const Color(0xff616161)),
                ),
*/