import 'package:flutter/material.dart';
import 'package:night_movie/core/utils/helper.dart';
import 'package:night_movie/core/widgets/show_web_view.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_rate_widget.dart';
import '../../../../movie/presentation/views/widgets/expanded_widget.dart';
import '../../../../tv/data/models/tv_detail_model.dart';

class TvMoreDetails extends StatelessWidget {
  final TvDetailModel
      model; // this model could be MovieModel or RecommendationModel
  const TvMoreDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.83,
                child: Text(
                  model.name,
                  style: Styles.font17.copyWith(
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () async {
                    // print(model.homePage);
                    model.homePage.isEmpty
                        ? await Helper.toast(
                            msg:
                                'Sorry the url of this series is not provided yet!',
                          )
                        : Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ShowWebView(url: model.homePage),
                            ),
                          );
                  },
                  icon: Image.asset(
                    'assets/images/eye.png',
                    width: 22,
                  ))
            ],
          ),
          const SizedBox(height: 10),
          CustomRateWidget(
            date: model.firstAirDate,
            rate: model.voteAverage,
            numberOfSeasons: model.numberOfSeasons,
            eposideRunTime: model.eposideRunTime.isNotEmpty
                ? model.eposideRunTime[0]
                : null,
          ),
          const SizedBox(height: 10),
          ExpandedWidget(overview: model.overview),
        ],
      ),
    );
  }
}
