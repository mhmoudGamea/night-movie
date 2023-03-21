import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/movie_model/movie_model.dart';
import '../models/recommendation_model/recommendation_model.dart';

abstract class MovieRepo {
  // apis handling functions
  Future<Either<Failure, List<MovieModel>>> getNowPlaying();
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();
  Future<Either<Failure, List<RecommendationModel>>> getRecommendationMovies(
      {required int movieId});
  // cloud firestore handling functions
  Future<DocumentReference<Map<String, dynamic>>> addToWatchList(
      String uId, Map<String, dynamic> json);
}
