import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';

class MovieGenerGenerated extends StatelessWidget {
  final List<dynamic> geners;
  const MovieGenerGenerated({Key? key, required this.geners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myGeners = Helper.getMovieGeners(geners);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Geners: ',
                style: Styles.font13.copyWith(color: const Color(0xff616161))),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: myGeners.length,
                separatorBuilder: (context, index) => const Text(
                  ', ',
                  style: TextStyle(color: Color(0xff616161)),
                ),
                itemBuilder: (context, index) => Text(
                  myGeners[index],
                  style: Styles.font13.copyWith(color: const Color(0xff616161)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
