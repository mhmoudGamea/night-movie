import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/search/data/repos/search_repo_impl.dart';
import 'package:night_movie/features/search/presentation/view_models/search_cubit/search_cubit.dart';

import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  static const rn = '/searchView';
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepoImpl()),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
