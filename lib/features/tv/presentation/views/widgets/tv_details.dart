import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../data/models/tv_detail_model.dart';
import 'tv_poster.dart';
import 'tv_trailer.dart';

class TvDetails extends StatelessWidget {
  final TvDetailModel model;
  const TvDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      child: Stack(
        children: [
          // series video trailer
          const TvTrailer(),
          // series poster, name, date, rate and geners
          Positioned(top: 130, left: 20, child: TvPoster(model: model)),
          Positioned(top: 0, left: 0, child: Helper.iconBack(context: context)),
        ],
      ),
    );
  }
}
