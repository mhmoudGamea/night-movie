import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerIndicator extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerIndicator(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
