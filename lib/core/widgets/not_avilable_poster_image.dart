import 'package:flutter/material.dart';
import 'package:night_movie/core/constants.dart';

class NotAvilablePosterImage extends StatelessWidget {
  final double height;
  final double width;
  final double size;
  const NotAvilablePosterImage(
      {Key? key, this.height = 150, this.width = 97.5, this.size = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryFirstDark,
      ),
      child: FittedBox(
        child: Text(
          'Not Avilable',
          style: TextStyle(color: Colors.grey, fontSize: size),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
