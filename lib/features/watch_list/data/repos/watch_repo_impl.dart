import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';
import 'package:night_movie/features/watch_list/data/models/watch_list_model.dart';
import 'package:night_movie/features/watch_list/data/repos/watch_repo.dart';

import '../../../../core/error/failure.dart';

class WatchRepoImpl implements WatchRepo {
  CollectionReference watchLists =
      FirebaseFirestore.instance.collection('watchLists');
  final uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Future<Either<Failure, bool>> saveWatchList(MovieModel movieModel) async {
    try {
      WatchListModel watchListModel = WatchListModel(
          backdropPath: movieModel.backdropPath,
          generIds: movieModel.generIds,
          id: movieModel.id,
          overview: movieModel.overview,
          releaseDate: movieModel.releaseDate,
          title: movieModel.title,
          voteAverage: movieModel.voteAverage,
          uid: uid);
      await watchLists.add(watchListModel.toJson());
      return right(true);
    } catch (error) {
      return left(const FirebaseSideError('Failed add to watchlist'));
    }
  }

  @override
  Future<Either<Failure, bool>> removeWatchList(MovieModel movieModel) async {
    try {
      final value = await watchLists.get();
      for (var element in value.docs) {
        if (element['backdrop_path'] == movieModel.backdropPath &&
            element['uid'] == uid) {
          element.reference.delete();
        }
      }
      return right(true);
    } catch (error) {
      return left(const FirebaseSideError('Failed remove from watchlist'));
    }
  }
}
