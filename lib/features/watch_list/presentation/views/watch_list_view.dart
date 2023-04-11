import 'package:flutter/material.dart';

import '../../../../core/utils/helper.dart';
import 'widgets/watch_list_view_body.dart';

class WatchListView extends StatelessWidget {
  static const rn = '/watchList';
  const WatchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.appBarWidget(name: 'Watch List', context: context),
      body: const WatchListViewBody(),
    );
  }
}
