import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/core/models/cast_model.dart';
import 'package:night_movie/features/tv/data/repos/tv_repo.dart';

part 'tv_cast_state.dart';

class TvCastCubit extends Cubit<TvCastState> {
  final TvRepo _tvRepo;
  TvCastCubit(this._tvRepo) : super(TvCastInitial());

  Future<void> getCast(int tvId) async {
    emit(TvCastLoading());
    final response = await _tvRepo.getCast(tvId: tvId);
    response.fold((failure) {
      emit(TvCastFailure(error: failure.errorMessage));
    }, (cast) {
      emit(TvCastSuccess(cast: cast));
    });
  }
}
