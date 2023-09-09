import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_top_rated/tv_top_rated_cubit.dart';

import '../../../../../core/widgets/grid_view_list_item.dart';
import '../../../data/models/tv_model.dart';
import '../tv_details_view.dart';

class TvTopRatedGridViewList extends StatefulWidget {
  final List<TvModel> model;
  const TvTopRatedGridViewList({Key? key, required this.model})
      : super(key: key);

  @override
  State<TvTopRatedGridViewList> createState() => _TvTopRatedGridViewListState();
}

class _TvTopRatedGridViewListState extends State<TvTopRatedGridViewList> {
  final ScrollController _scrollController = ScrollController();

  var _page = 2;
  var _isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListner);
  }

  void _scrollListner() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollExtent = _scrollController.position.maxScrollExtent;
    var percentage = (currentPosition / maxScrollExtent) * 100;
    if (percentage >= 70) {
      if (!_isLoading) {
        _isLoading = true;
        await BlocProvider.of<TvTopRatedCubit>(context)
            .fetchTvTopRated(page: _page++);
        _isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
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
          GoRouter.of(context)
              .push(TvDetailsView.rn, extra: widget.model[index].id);
        },
        child: GridViewListItem(
          model: widget.model[index],
        ),
      ),
      itemCount: widget.model.length,
    );
  }
}
