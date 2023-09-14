import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/core/utils/styles.dart';

class Error105 extends StatelessWidget {
  final String text;
  const Error105({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: primaryFirstDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            size: 20,
            color: Colors.amber,
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Text(
              text,
              style: Styles.font14,
            ),
          ),
        ],
      ),
    );
  }
}
