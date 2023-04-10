import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/features/watch_list/data/repos/watch_repo.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../movie/data/models/movie_model/movie_model.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  final WatchRepo _watchRepo;
  WatchListCubit(this._watchRepo) : super(WatchListInitial());

  // cloud firestore handling functions

  // this function will take the movie id and if it find an return all
  // identical movies to this one from watchList in firestore
  // https://firebase.flutter.dev/docs/firestore/usage#querying
  // https://firebase.flutter.dev/docs/firestore/usage#removing-data

  // this function depend on ids List if it find the movieId in this list
  // it will remove it otherwise it 'll add it
  // add & remove is locally and on fireStore with nice toast

  // it just listen to each new user and save all them watchLists

  Future<void> watchList(
      {required BuildContext context,
      required MovieModel movieModel,
      required bool inWatchList}) async {
    if (inWatchList) {
      final response = await _watchRepo.saveWatchList(movieModel);
      response.fold((failure) {
        Helper.failMessage(context, failure.errorMessage);
      }, (success) {
        Helper.successMessage(context, 'Success add to watchlist');
      });
    } else {
      final response = await _watchRepo.removeWatchList(movieModel);
      response.fold((failure) {
        Helper.failMessage(context, failure.errorMessage);
      }, (success) {
        Helper.successMessage(context, 'Success remove from watchlist');
      });
    }
  }
}
