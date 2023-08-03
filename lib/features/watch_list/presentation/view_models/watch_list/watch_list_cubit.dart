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
        // await getMyWatchList();
      });
    }
  }
}
