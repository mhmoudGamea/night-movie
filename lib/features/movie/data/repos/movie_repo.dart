import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/movie_model/movie_model.dart';
import '../models/recommendation_model/recommendation_model.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieModel>>> getNowPlaying();
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();
  Future<Either<Failure, List<RecommendationModel>>> getRecommendationMovies(
      {required int movieId});
}
