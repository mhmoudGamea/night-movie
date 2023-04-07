import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';
import 'package:night_movie/features/movie/data/repos/movie_repo.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  final MovieRepo _movieRepo;
  WatchListCubit(this._movieRepo) : super(WatchListInitial());

  // cloud firestore handling functions
  CollectionReference watchLists =
      FirebaseFirestore.instance.collection(usersWatchListsCollection);

  // contain all ids of watchListMovies
  final List<dynamic> _ids = [];

  List<dynamic> get getIds {
    return _ids;
  }

  // this function will take the movie id and if it find an return all
  // identical movies to this one from watchList in firestore
  // https://firebase.flutter.dev/docs/firestore/usage#querying
  // https://firebase.flutter.dev/docs/firestore/usage#removing-data
  Future<void> deleteDocument(int movieId) async {
    final query = await watchLists
        .doc('yyTbyyKO9xREWQjg4aXIM2thJWp1')
        .collection('watchList')
        .where('id', isEqualTo: movieId)
        .get();
    for (var doc in query.docs) {
      await watchLists
          .doc('yyTbyyKO9xREWQjg4aXIM2thJWp1')
          .collection('watchList')
          .doc(doc.id)
          .delete();
    }
  }

  // this function depend on ids List if it find the movieId in this list
  // it will remove it otherwise it 'll add it
  // add & remove is locally and on fireStore with nice toast
  Future<void> watchList(dynamic movieModel, BuildContext context) async {
    try {
      if (!_ids.contains(movieModel.id)) {
        _ids.add(movieModel.id);
        emit(GetWatchListIdsSuccess());
        await _movieRepo.addToWatchList(
            'yyTbyyKO9xREWQjg4aXIM2thJWp1', movieModel.toJson());
        emit(WatchListSuccess());
        // ignore: use_build_context_synchronously
        Helper.showToast(
            context: context,
            color: primaryColor,
            icon: FontAwesomeIcons.circleCheck,
            message: 'The movie is added to your watch list');
      } else {
        await deleteDocument(movieModel.id);
        _ids.remove(movieModel.id);
        emit(RemoveWatchListIdsSuccess());
        // ignore: use_build_context_synchronously
        Helper.showToast(
            context: context,
            color: Colors.red.shade300,
            icon: FontAwesomeIcons.trash,
            message: 'The movie is removed from your watch list');
      }
    } catch (error) {
      emit(WatchListFailure());
    }
  }

  // get all watchLists
  final List<MovieModel> _moviesModel = [];

  // it just listen to each new user and save all them watchLists
  void getMoviesIds(String uId) async {
    watchLists.snapshots().listen((event) async {
      await watchLists
          .doc('yyTbyyKO9xREWQjg4aXIM2thJWp1')
          .collection('watchList')
          .get()
          .then((value) {
        for (var doc in value.docs) {
          _moviesModel.add(
            MovieModel.fromJson(
              doc.data(),
            ),
          );
        }
        for (var movie in _moviesModel) {
          _ids.add(movie.id);
          emit(GetWatchListIdsSuccess());
        }
      });
    });
  }
}
