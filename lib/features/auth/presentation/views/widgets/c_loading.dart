import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CLoading extends StatelessWidget {
  const CLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 23,
          width: 23,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        ),
        SizedBox(width: 5),
        Text('Waiting...', style: Styles.font16)
      ],
    );
  }
}
