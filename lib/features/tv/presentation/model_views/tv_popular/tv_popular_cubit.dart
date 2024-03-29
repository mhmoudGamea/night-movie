import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/features/tv/data/models/tv_model.dart';
import 'package:night_movie/features/tv/data/repos/tv_repo.dart';

part 'tv_popular_state.dart';

class TvPopularCubit extends Cubit<TvPopularState> {
  final TvRepo _tvRepo;
  TvPopularCubit(this._tvRepo) : super(TvPopularInitial());

  Future<void> fetchTvPopular({int page = 1}) async {
    page == 1 ? emit(TvPopularLoading()) : emit(TvPopularPaginationLoading());
    final response = await _tvRepo.getTvPopular(page: page);
    response.fold((failure) {
      emit(TvPopularFailure(error: failure.errorMessage));
    }, (tvs) {
      emit(TvPopularSuccess(tvs: tvs));
    });
  }
}
