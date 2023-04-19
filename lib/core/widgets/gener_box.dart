import 'package:flutter/material.dart';
import 'package:night_movie/core/constants.dart';

import '../utils/styles.dart';

class GenerBox extends StatelessWidget {
  final String text;
  const GenerBox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryFirstDark,
      ),
      child: Text(
        text,
        style: Styles.font13
            .copyWith(color: const Color.fromARGB(255, 135, 134, 134)),
      ),
    );
  }
}
