import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/tv/presentation/views/tv_details_view.dart';

import '../../../../movie/presentation/views/details_view.dart';
import '../../../data/models/search_model.dart';
import 'search_list_view_item.dart';

class SearchListView extends StatelessWidget {
  final List<SearchModel> searchList;
  const SearchListView({Key? key, required this.searchList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: searchList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          //print(searchList[index].mediaType);

          if (searchList[index].mediaType == 'movie') {
            GoRouter.of(context).push(DetailsView.rn, extra: searchList[index]);
          } else {
            GoRouter.of(context)
                .push(TvDetailsView.rn, extra: searchList[index].id);
          }
        },
        child: SearchListViewItem(searchedMovie: searchList[index]),
      ),
    );
  }
}
