import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class SectionDetailsHeader extends StatelessWidget {
  final String header;
  final double size;
  final Color color;
  const SectionDetailsHeader(
      {Key? key, required this.header, this.size = 16, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        header,
        style: Styles.font16.copyWith(color: color, fontSize: size),
      ),
    );
  }
}
