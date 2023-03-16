import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model/movie_model.dart';
import '../../../data/repos/movie_repo.dart';
part './now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final MovieRepo _movieRepo;
  NowPlayingCubit(this._movieRepo) : super(NowPlayingInitial());

  Future<void> fetchNowPlaying() async {
    emit(NowPlayingLoading());

    var response = await _movieRepo.getNowPlaying();
    response.fold((failure) {
      emit(NowPlayingFailure(error: failure.errorMessage));
    }, (movies) {
      emit(NowPlayingSuccess(movies: movies));
    });
  }
}
