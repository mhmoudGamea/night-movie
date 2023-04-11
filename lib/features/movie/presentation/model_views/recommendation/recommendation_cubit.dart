import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:night_movie/features/movie/data/models/movie_model/movie_model.dart';

import '../../../data/repos/movie_repo.dart';
part './recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  final MovieRepo _movieRepo;
  RecommendationCubit(this._movieRepo) : super(RecommendationInitial());

  Future<void> fetchRecommendation({required int movieId}) async {
    emit(RecommendationLoading());
    var response = await _movieRepo.getRecommendationMovies(movieId: movieId);

    response.fold((failure) {
      emit(RecommendationFailure(error: failure.errorMessage));
    }, (recommendations) {
      emit(RecommendationSuccess(recommendations: recommendations));
    });
  }
}
