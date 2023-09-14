import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/gener_box.dart';

class MovieGenerGenerated extends StatelessWidget {
  final List<dynamic>? geners;
  const MovieGenerGenerated({Key? key, required this.geners}) : super(key: key);

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
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  '|',
                  style: Styles.font13.copyWith(
                      color: const Color.fromARGB(255, 135, 134, 134)),
                ),
              ),
              itemBuilder: (context, index) => GenerBox(text: myGeners[index]),
            ),
          )
        ],
      ),
    );
  }
}
