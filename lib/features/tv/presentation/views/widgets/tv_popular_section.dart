import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/core/widgets/section_header.dart';
import 'package:night_movie/features/tv/presentation/views/tv_popular_view.dart';
import 'package:night_movie/features/tv/presentation/views/widgets/tv_popular_list_view.dart';

class TvPopularSection extends StatelessWidget {
  const TvPopularSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Popular',
          navigate: () {
            GoRouter.of(context).push(TvPopularView.rn);
          },
        ),
        const SizedBox(height: 5),
        const TvPopularListView(),
      ],
    );
  }
}
