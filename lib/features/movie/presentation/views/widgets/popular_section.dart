import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../popular_view.dart';
import '../../../../../core/widgets/section_header.dart';
import './popular_list_view.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
            title: 'Popular',
            navigate: () {
              GoRouter.of(context).push(PopularView.rn);
            }),
        const SizedBox(height: 5),
        const PopularListView(),
      ],
    );
  }
}
