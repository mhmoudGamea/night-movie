import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/custom_error_box.dart';
import '../../../../movie/presentation/views/widgets/top_rated_movie_grid_view_list.dart';
import 'c_no_watch_list_yet.dart';

class WatchListViewBody extends StatefulWidget {
  const WatchListViewBody({Key? key}) : super(key: key);

  @override
  State<WatchListViewBody> createState() => _WatchListViewBodyState();
}

class _WatchListViewBodyState extends State<WatchListViewBody> {
  final Stream<QuerySnapshot> _watchLists =
      FirebaseFirestore.instance.collection('watchLists').snapshots();
  final uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primarySecondDark,
      child: StreamBuilder<QuerySnapshot>(
        stream: _watchLists,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return CustomErrorBox(errorMessage: snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: primaryColor));
          } else if (snapshot.hasData) {
            List<MovieModel> watch = [];
            snapshot.data!.docs.map((item) {
              if (item['uid'] == uid) {
                watch.add(MovieModel.fromFirestore(item));
              }
            }).toList();
            if (watch.isEmpty) {
              return const CNoWatchListYet();
            }
            //TODO: change TopRatedMovieGridViewList to another name
            return TopRatedMovieGridViewList(movies: watch);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
