import 'package:flutter/material.dart';
import 'package:night_movie/core/models/cast_model.dart';
import 'package:night_movie/core/utils/helper.dart';
import 'package:night_movie/core/widgets/not_avilable_poster_image.dart';

import '../utils/styles.dart';

class CastItem extends StatelessWidget {
  final CastModel castModel;
  const CastItem({Key? key, required this.castModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        castModel.actorProfilePath!.isEmpty
            ? const NotAvilablePosterImage(
                width: 80,
                height: 100,
                size: 12,
              )
            : SizedBox(
                width: 80,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    Helper.getImagePath(castModel.actorProfilePath!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        const SizedBox(height: 10),
        SizedBox(
          width: 80,
          height: 20,
          child: Text(
            castModel.actorName!,
            style: Styles.font13.copyWith(color: Colors.grey[700]),
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
