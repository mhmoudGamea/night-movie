import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';

import '../../features/movie/presentation/views/details_view.dart';
import './grid_view_list_item.dart';

class GridViewList<T> extends StatelessWidget {
  final List<T> model;
  const GridViewList({Key? key, required this.model}) : super(key: key);

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
          if (model is MovieModel) {
            GoRouter.of(context).push(DetailsView.rn, extra: model[index]);
          } else {
            // print('TvModel');
            // GoRouter.of(context).push(DetailsView.rn, extra: model[index].id);
          }
        },
        child: GridViewListItem(
          model: model[index],
        ),
      ),
      itemCount: model.length,
    );
  }
}
