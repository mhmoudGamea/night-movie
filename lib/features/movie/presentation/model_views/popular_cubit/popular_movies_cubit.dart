import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model/movie_model.dart';
import '../../../data/repos/movie_repo.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final MovieRepo _movieRepo;
  PopularMoviesCubit(this._movieRepo) : super(PopularMoviesInitial());

  Future<void> fetchPopularMovies({int page = 1}) async {
    page == 1
        ? emit(PopularMoviesLoading())
        : emit(PopularMoviesPaginationLoading());
    var response = await _movieRepo.getPopularMovies(page: page);
    response.fold((failure) {
      emit(PopularMoviesFailure(error: failure.errorMessage));
    }, (movies) {
      emit(PopularMoviesSuccess(movies: movies));
    });
  }
}
