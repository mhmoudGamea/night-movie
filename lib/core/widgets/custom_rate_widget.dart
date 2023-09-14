import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/helper.dart';
import '../utils/styles.dart';

class CustomRateWidget extends StatelessWidget {
  final String? date;
  final num rate;
  final int? numberOfSeasons;
  final dynamic eposideRunTime;
  const CustomRateWidget({
    super.key,
    required this.date,
    required this.rate,
    this.numberOfSeasons,
    this.eposideRunTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: primaryColor.withOpacity(0.5)),
          child: Text(
              date == null
                  ? 'N/A'
                  : (date!.isEmpty ? 'N/ A' : Helper.getYearOfDate(date!)),
              style: Styles.font13),
        ),
        const SizedBox(width: 20),
        const Icon(
          Icons.star_rounded,
          color: Color(0xffFFC107),
          size: 21,
        ),
        const SizedBox(width: 3),
        Text(rate.toStringAsFixed(1), style: Styles.font13),
        const SizedBox(width: 10),
        if (numberOfSeasons != null)
          Text(
              numberOfSeasons == 1
                  ? '$numberOfSeasons Season'
                  : '$numberOfSeasons Seasons',
              style: Styles.font13),
      ],
    );
  }
}
