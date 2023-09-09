import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/section_header.dart';
import '../tv_top_rated_view.dart';
import 'tv_top_rated_list_view_bloc_consumer.dart';

class TvTopRatedSection extends StatelessWidget {
  const TvTopRatedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
            title: 'Top Rated',
            navigate: () {
              GoRouter.of(context).push(TvTopRatedView.rn);
            }),
        const SizedBox(height: 5),
        const TvTopRatedListViewBlocConsumer(),
      ],
    );
  }
}
