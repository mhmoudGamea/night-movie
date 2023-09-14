import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../watch_list/presentation/view_models/watch_list/watch_list_cubit.dart';

class MovieTitle extends StatefulWidget {
  final MovieModel model;
  const MovieTitle({Key? key, required this.model}) : super(key: key);

  @override
  State<MovieTitle> createState() => _MovieTitleState();
}

class _MovieTitleState extends State<MovieTitle> {
  var inWatchList = false;

  @override
  void didChangeDependencies() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('watchLists')
        .get()
        .then((value) {
      for (var element in value.docs) {
        if (element['backdrop_path'] == widget.model.backdropPath &&
            element['uid'] == uid) {
          setState(() {
            inWatchList = true;
          });
        }
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            widget.model.title,
            style: Styles.font17,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        ),
        BlocBuilder<WatchListCubit, WatchListState>(
          builder: (context, state) {
            return IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () async {
                setState(() {
                  inWatchList = !inWatchList;
                });
                BlocProvider.of<WatchListCubit>(context).watchList(
                    context: context,
                    movieModel: widget.model,
                    inWatchList: inWatchList);
              },
              icon: Icon(
                inWatchList ? Icons.bookmark_add : Icons.bookmark_add_outlined,
                size: 20,
                color: inWatchList
                    ? primaryColor.withOpacity(0.4)
                    : primaryColor.withOpacity(0.5),
              ),
            );
          },
        ),
      ],
    );
  }
}
