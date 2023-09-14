import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/features/movie/data/repos/movie_repo.dart';

import '../../../../../core/models/cast_model.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  final MovieRepo _movieRepo;
  CastCubit(this._movieRepo) : super(CastInitial());

  Future<void> getCast(int movieId) async {
    emit(CastLoading());
    final response = await _movieRepo.getCast(movieId: movieId);
    response.fold((failure) {
      emit(CastFailure(error: failure.errorMessage));
    }, (cast) {
      emit(CastSuccess(cast: cast));
    });
  }
}
