import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class CNoWatchListYet extends StatelessWidget {
  const CNoWatchListYet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: primaryFirstDark,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          children: [
            Icon(
              FontAwesomeIcons.faceSadTear,
              size: 20,
              color: Colors.amber,
            ),
            SizedBox(width: 10),
            Flexible(
              child: FittedBox(
                child: Text(
                  'There is no movie added to the watchlist yet.',
                  style: Styles.font14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
