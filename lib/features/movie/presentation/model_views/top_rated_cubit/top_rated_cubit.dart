import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model/movie_model.dart';
import '../../../data/repos/movie_repo.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final MovieRepo _movieRepo;
  TopRatedCubit(this._movieRepo) : super(TopRatedInitial());

  Future<void> fetchTopRatedMovies({int page = 1}) async {
    page == 1
        ? emit(TopRatedMoviesLoading())
        : emit(TopRatedMoviesPaginationLoading());

    var response = await _movieRepo.getTopRatedMovies(page: page);
    response.fold((failure) {
      emit(TopRatedMoviesFailure(error: failure.errorMessage));
    }, (movies) {
      emit(TopRatedMoviesSuccess(movies: movies));
    });
  }
}
