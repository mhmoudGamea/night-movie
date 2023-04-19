import 'package:flutter/material.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/core/utils/styles.dart';

class KeepSigin extends StatefulWidget {
  const KeepSigin({Key? key}) : super(key: key);

  @override
  State<KeepSigin> createState() => _KeepSiginState();
}

class _KeepSiginState extends State<KeepSigin> {
  var keepSign = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.8,
          child: SizedBox(
            height: 10,
            width: 20,
            child: Checkbox(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              side: BorderSide(width: 1, color: primaryColor.withOpacity(0.3)),
              activeColor: primaryColor,
              checkColor: Colors.white,
              value: keepSign,
              onChanged: (value) {
                setState(
                  () {
                    keepSign = value!;
                  },
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Keep me signed in',
          style: Styles.font14,
        )
      ],
    );
  }
}
