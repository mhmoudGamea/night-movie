import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/core/widgets/not_avilable_poster_image.dart';
import 'package:night_movie/features/tv/presentation/model_views/tv_top_rated/tv_top_rated_cubit.dart';
import 'package:night_movie/features/tv/presentation/views/tv_details_view.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/movie_tv_poster_image.dart';
import '../../../data/models/tv_model.dart';

class TvTopRatedListView extends StatefulWidget {
  final List<TvModel> tvs;
  const TvTopRatedListView({Key? key, required this.tvs}) : super(key: key);

  @override
  State<TvTopRatedListView> createState() => _TvTopRatedListViewState();
}

class _TvTopRatedListViewState extends State<TvTopRatedListView> {
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
    return SizedBox(
      height: 150,
      child: ListView.separated(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.tvs.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(TvDetailsView.rn, extra: widget.tvs[index].id);
          },
          child: widget.tvs[index].backdropPath == null
              ? const NotAvilablePosterImage()
              : MovieTvPosterImage(
                  imageUrl:
                      Helper.getImagePath(widget.tvs[index].backdropPath!)),
        ),
      ),
    );
  }
}
