// for popular and top rated movies
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/movie_model/movie_model.dart';
import '../details_view.dart';
import '../../../../../core/widgets/grid_view_list_item.dart';

class MovieGridViewList extends StatelessWidget {
  final List<MovieModel> model;
  const MovieGridViewList({Key? key, required this.model}) : super(key: key);

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
          // go to movie details page
          GoRouter.of(context).push(DetailsView.rn, extra: model[index]);
        },
        child: GridViewListItem(
          model: model[index],
        ),
      ),
      itemCount: model.length,
    );
  }
}
