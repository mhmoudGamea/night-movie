import 'package:flutter/material.dart';

import '../models/cast_model.dart';
import 'cast_item.dart';

class CastList extends StatelessWidget {
  final List<CastModel> list;
  const CastList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: list.length,
        itemBuilder: (context, index) => CastItem(castModel: list[index]),
      ),
    );
  }
}
