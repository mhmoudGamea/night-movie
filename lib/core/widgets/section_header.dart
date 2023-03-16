import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback navigate;
  const SectionHeader({Key? key, required this.title, required this.navigate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.font17.copyWith(letterSpacing: 1),
          ),
          GestureDetector(
            onTap: navigate,
            child: Row(
              children: [
                Text(
                  'See more',
                  style: Styles.font13.copyWith(color: primaryColor),
                ),
                const SizedBox(width: 3),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
