import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingShimmer extends StatelessWidget {
  const NowPlayingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          aspectRatio: 30 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          //autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 500),
          viewportFraction: 0.83,
        ),
        items: List.generate(
          20,
          (index) => Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
      ),
    );
  }
}
