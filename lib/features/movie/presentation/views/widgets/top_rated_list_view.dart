import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';
import 'package:night_movie/features/movie/presentation/model_views/top_rated_cubit/top_rated_cubit.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/movie_poster_image.dart';
import '../../../../../core/widgets/not_avilable_poster_image.dart';
import '../details_view.dart';

class TopRatedListView extends StatefulWidget {
  final List<MovieModel> movies;
  const TopRatedListView({Key? key, required this.movies}) : super(key: key);

  @override
  State<TopRatedListView> createState() => _TopRatedListViewState();
}

class _TopRatedListViewState extends State<TopRatedListView> {
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
        await BlocProvider.of<TopRatedCubit>(context)
            .fetchTopRatedMovies(page: _page++);
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
              : MoviePosterImage(
                  imageUrl:
                      Helper.getImagePath(widget.movies[index].backdropPath!)),
        ),
      ),
    );
  }
}
