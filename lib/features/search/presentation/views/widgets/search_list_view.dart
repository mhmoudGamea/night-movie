import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../movie/presentation/views/details_view.dart';
import '../../../data/models/search_model/search_model.dart';
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
          GoRouter.of(context).push(DetailsView.rn, extra: searchList[index]);
        },
        child: SearchListViewItem(searchedMovie: searchList[index]),
      ),
    );
  }
}
