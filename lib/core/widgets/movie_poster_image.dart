import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import './shimmer_indicator.dart';

class MoviePosterImage extends StatelessWidget {
  final String? imageUrl;

  const MoviePosterImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: BoxFit.cover,
            placeholder: (context, name) =>
                const ShimmerIndicator(width: 97.5, height: 150),
          ),
        ),
      ),
    );
  }
}
