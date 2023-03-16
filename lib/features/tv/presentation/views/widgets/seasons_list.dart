import 'package:flutter/material.dart';
import 'season_item.dart';

class SeasonsList extends StatelessWidget {
  final int tvId;
  final int numberOfSeasons;
  const SeasonsList(
      {Key? key, required this.tvId, required this.numberOfSeasons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemCount: numberOfSeasons,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) =>
          SeasonItem(tvId: tvId, seasonNumber: index + 1),
    );
  }
}
