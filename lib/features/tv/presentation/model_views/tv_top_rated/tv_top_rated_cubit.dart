import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/features/tv/data/repos/tv_repo.dart';

import '../../../data/models/tv_model.dart';

part 'tv_top_rated_state.dart';

class TvTopRatedCubit extends Cubit<TvTopRatedState> {
  final TvRepo _tvRepo;
  TvTopRatedCubit(this._tvRepo) : super(TvTopRatedInitial());

  Future<void> fetchTvTopRated({int page = 1}) async {
    page == 1 ? emit(TvTopRatedLoading()) : emit(TvTopRatedPaginationLoading());
    final response = await _tvRepo.getTvTopRated(page: page);
    response.fold((failure) {
      emit(TvTopRatedFailure(error: failure.errorMessage));
    }, (tvs) {
      emit(TvTopRatedSuccess(tvs: tvs));
    });
  }
}
