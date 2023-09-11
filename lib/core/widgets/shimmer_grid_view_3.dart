import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridView3 extends StatelessWidget {
  const ShimmerGridView3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.6 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => _indicator(),
        itemCount: 21,
      ),
    );
  }

  Container _indicator() {
    return Container(
      width: 97.5,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
