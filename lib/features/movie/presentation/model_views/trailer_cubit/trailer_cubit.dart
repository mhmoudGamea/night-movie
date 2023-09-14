import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/core/models/trailer_model.dart';
import 'package:night_movie/core/widgets/error_105.dart';
import 'package:night_movie/features/movie/data/repos/movie_repo.dart';

import '../../../../../core/widgets/trailer_box.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  final MovieRepo _movieRepo;
  TrailerCubit(this._movieRepo) : super(TrailerInitial());

  Future<void> fetchTrailer({required int movieId}) async {
    log(movieId.toString());
    emit(TrailerLoading());
    var response = await _movieRepo.getTrailer(movieId: movieId);
    response.fold((failure) {
      debugPrint(failure.errorMessage);
      emit(TrailerFailure(error: failure.errorMessage));
    }, (trailers) {
      emit(TrailerSuccess(trailers: trailers));
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
              'Sorry, there ara no official trailer for this $type right now'),
    );
  }
}
