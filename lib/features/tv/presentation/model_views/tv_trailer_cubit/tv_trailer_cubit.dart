import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/core/models/trailer_model.dart';
import 'package:night_movie/features/tv/data/repos/tv_repo.dart';

part 'tv_trailer_state.dart';

class TvTrailerCubit extends Cubit<TvTrailerState> {
  final TvRepo _tvRepo;
  TvTrailerCubit(this._tvRepo) : super(TvTrailerInitial());

  Future<void> fetchTvTrailers({required int tvId}) async {
    emit(TvTrailerLoading());

    var response = await _tvRepo.getTvTrailers(tvId: tvId);
    response.fold((failure) {
      debugPrint(failure.errorMessage);
      emit(TvTrailerFailure(error: failure.errorMessage));
    }, (trailers) {
      var official = isOfficial(trailers);
      emit(TvTrailerSuccess(trailers: trailers, official: official));
    });
  }

  bool isOfficial(List<TrailerModel> trailers) {
    var official = false;
    if (trailers.isNotEmpty) {
      for (var i = 0; i < trailers.length; i++) {
        if (trailers[i].official) {
          official = true;
          break;
        }
      }
    }
    return official;
  }
}
