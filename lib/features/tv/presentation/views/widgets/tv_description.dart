import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class TvDescription extends StatelessWidget {
  final String overview;
  final double horizontalPadding;
  const TvDescription(
      {Key? key, required this.overview, this.horizontalPadding = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
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
