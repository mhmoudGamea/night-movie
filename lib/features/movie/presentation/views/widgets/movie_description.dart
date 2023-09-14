import 'package:flutter/material.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/core/utils/styles.dart';
import 'package:readmore/readmore.dart';

class MovieDescription extends StatelessWidget {
  final String overview;
  const MovieDescription({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ReadMoreText(
        overview,
        style: Styles.font14.copyWith(color: Colors.grey[700]),
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show More',
        trimExpandedText: ' Show less',
        moreStyle: Styles.font14.copyWith(color: primaryColor.withOpacity(0.4)),
        lessStyle: Styles.font14.copyWith(color: primaryColor.withOpacity(0.5)),
      ),
    );
  }
}
