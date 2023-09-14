import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/core/models/trailer_model.dart';
import 'package:night_movie/features/tv/data/repos/tv_repo.dart';

import '../../../../../core/widgets/error_105.dart';
import '../../../../../core/widgets/trailer_box.dart';

part 'tv_trailer_state.dart';

class TvTrailerCubit extends Cubit<TvTrailerState> {
  final TvRepo _tvRepo;
  TvTrailerCubit(this._tvRepo) : super(TvTrailerInitial());

  Future<void> fetchTvTrailers({required int tvId}) async {
    log(tvId.toString());
    emit(TvTrailerLoading());
    var response = await _tvRepo.getTvTrailers(tvId: tvId);
    response.fold((failure) {
      debugPrint(failure.errorMessage);
      emit(TvTrailerFailure(error: failure.errorMessage));
    }, (trailers) {
      emit(TvTrailerSuccess(trailers: trailers));
    });
  }

  Widget showTrailer(
      {required List<TrailerModel> trailers, required String type}) {
    for (var trailer in trailers) {
      if (trailer.type == 'Trailer' && trailer.official) {
        return SizedBox(
          height: trailers.isEmpty ? 0 : 180,
          width: double.infinity,
          child: TrailerBox(
            videoKey: trailer.key,
          ),
        );
      }
    }
    // Warning: not official trailer 'll produce networkError while debuging
    for (var trailer in trailers) {
      if (trailer.type == 'Trailer' && !trailer.official) {
        return const SizedBox(
          height: 180,
          child: Error105(
              text:
                  'This video contains content from Core Republic, who has blocked it on copyright grounds'),
        );
      }
    }
    // trailers.isEmpty
    return SizedBox(
      height: 180,
      child: Error105(
          text:
              'Sorry, there ara no official trailer for this $type video right now'),
    );
  }
}
