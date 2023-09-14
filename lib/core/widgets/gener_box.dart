import 'package:flutter/material.dart';

import '../utils/styles.dart';

class GenerBox extends StatelessWidget {
  final String text;
  const GenerBox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.font13
          .copyWith(color: const Color.fromARGB(255, 135, 134, 134)),
    );
  }
}
