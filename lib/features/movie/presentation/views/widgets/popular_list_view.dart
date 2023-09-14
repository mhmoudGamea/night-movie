import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/movie_tv_poster_image.dart';
import '../../../../../core/widgets/not_avilable_poster_image.dart';
import '../../../data/models/movie_model/movie_model.dart';
import '../../model_views/popular_cubit/popular_movies_cubit.dart';
import '../details_view.dart';

class PopularListView extends StatefulWidget {
  final List<MovieModel> movies;
  const PopularListView({super.key, required this.movies});

  @override
  State<PopularListView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<PopularListView> {
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
        await BlocProvider.of<PopularMoviesCubit>(context)
            .fetchPopularMovies(page: _page++);
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
        itemCount: widget.movies.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(DetailsView.rn, extra: widget.movies[index]);
          },
          child: widget.movies[index].backdropPath == null
              ? const NotAvilablePosterImage()
              : MovieTvPosterImage(
                  imageUrl:
                      Helper.getImagePath(widget.movies[index].backdropPath!)),
        ),
      ),
    );
  }
}
