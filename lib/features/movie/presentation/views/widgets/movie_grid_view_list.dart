// for popular and top rated movies
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/movie/presentation/model_views/popular_cubit/popular_movies_cubit.dart';

import '../../../data/models/movie_model/movie_model.dart';
import '../details_view.dart';
import '../../../../../core/widgets/grid_view_list_item.dart';

class MovieGridViewList extends StatefulWidget {
  final List<MovieModel> model;
  const MovieGridViewList({Key? key, required this.model}) : super(key: key);

  @override
  State<MovieGridViewList> createState() => _MovieGridViewListState();
}

class _MovieGridViewListState extends State<MovieGridViewList> {
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
    var maxScrollExtend = _scrollController.position.maxScrollExtent;
    var percentage = (currentPosition / maxScrollExtend) * 100;
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
          // go to movie details page
          GoRouter.of(context).push(DetailsView.rn, extra: widget.model[index]);
        },
        child: GridViewListItem(
          model: widget.model[index],
        ),
      ),
      itemCount: widget.model.length,
    );
  }
}
