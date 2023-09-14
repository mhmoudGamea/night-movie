import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCast extends StatelessWidget {
  const ShimmerCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: SizedBox(
        height: 140,
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 10,
          itemBuilder: (context, index) => _indicator(),
        ),
      ),
    );
  }

  Widget _indicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 80,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
