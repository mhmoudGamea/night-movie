import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/features/movie/data/models/trailer_model/trailer_model.dart';
import 'package:night_movie/features/movie/data/repos/movie_repo.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  final MovieRepo _movieRepo;
  TrailerCubit(this._movieRepo) : super(TrailerInitial());

  Future<void> fetchTrailer({required int movieId}) async {
    emit(TrailerLoading());
    var response = await _movieRepo.getTrailer(movieId: movieId);
    response.fold((failure) {
      debugPrint(failure.errorMessage);
      emit(TrailerFailure(error: failure.errorMessage));
    }, (trailers) {
      emit(TrailerSuccess(trailers: trailers));
    });
  }
}
