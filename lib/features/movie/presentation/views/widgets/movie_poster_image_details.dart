import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/arrow_back_icon.dart';
import '../../../../../core/widgets/not_avilable_poster_image.dart';
import '../../../../../core/widgets/shimmer_indicator.dart';

class MoviePosterImageDetails extends StatelessWidget {
  final String? imageUrl;
  const MoviePosterImageDetails({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 230,
          child: imageUrl == null
              ? const NotAvilablePosterImage()
              : CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const ShimmerIndicator(
                      width: double.infinity, height: 230),
                ),
        ),
        const Positioned(
          top: 15,
          left: 10,
          child: ArrowBackIcon(),
        ),
      ],
    );
  }
}
