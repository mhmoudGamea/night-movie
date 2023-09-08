import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:night_movie/core/models/trailer_model.dart';

import '../../../../core/error/failure.dart';
import '../models/movie_model/movie_model.dart';

abstract class MovieRepo {
  // apis handling functions
  Future<Either<Failure, List<MovieModel>>> getNowPlaying();
  Future<Either<Failure, List<MovieModel>>> getPopularMovies({int page = 1});
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies({int page = 1});
  Future<Either<Failure, List<TrailerModel>>> getTrailer(
      {required int movieId});
  Future<Either<Failure, List<MovieModel>>> getRecommendationMovies(
      {required int movieId});
  // cloud firestore handling functions
  Future<DocumentReference<Map<String, dynamic>>> addToWatchList(
      String uId, Map<String, dynamic> json);
}
