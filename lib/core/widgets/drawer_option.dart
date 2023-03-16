import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/styles.dart';

class DrawerOption extends StatelessWidget {
  final String optionImage;
  final String optionName;
  final VoidCallback onPress;
  const DrawerOption(
      {Key? key,
      required this.optionImage,
      required this.optionName,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: primaryFirstDark.withOpacity(0.9),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: primarySecondDark,
              ),
            ]),
        child: Row(
          children: [
            Image.asset(optionImage, width: 26),
            const SizedBox(width: 10),
            Text(
              optionName,
              style: Styles.font17.copyWith(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
