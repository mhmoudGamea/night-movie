// for popular and top rated tv series
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/tv/data/models/tv_model.dart';
import 'package:night_movie/features/tv/presentation/views/tv_details_view.dart';

import '../../../../../core/widgets/grid_view_list_item.dart';

class TvGridViewList extends StatelessWidget {
  final List<TvModel> model;
  const TvGridViewList({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.6 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          // go to tv details page
          GoRouter.of(context).push(TvDetailsView.rn, extra: model[index].id);
        },
        child: GridViewListItem(
          model: model[index],
        ),
      ),
      itemCount: model.length,
    );
  }
}
