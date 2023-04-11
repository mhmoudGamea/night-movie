import 'package:dartz/dartz.dart';
import 'package:night_movie/core/error/failure.dart';

import '../../../movie/data/models/movie_model/movie_model.dart';

abstract class WatchRepo {
  Future<Either<Failure, bool>> saveWatchList(MovieModel movieModel);
  Future<Either<Failure, bool>> removeWatchList(MovieModel movieModel);
  // Future<Either<Failure, List<MovieModel>>> getWatchList();
}
