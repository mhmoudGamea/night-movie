import 'package:dartz/dartz.dart';
import 'package:night_movie/core/error/failure.dart';
import 'package:night_movie/features/tv/data/models/tv_detail_model.dart';
import 'package:night_movie/features/tv/data/models/tv_episodes_model.dart';

import '../models/tv_model.dart';

abstract class TvRepo {
  Future<Either<Failure, List<TvModel>>> getOnTheAir();
  Future<Either<Failure, List<TvModel>>> getTvPopular();
  Future<Either<Failure, List<TvModel>>> getTvTopRated();
  Future<Either<Failure, TvDetailModel>> getTvSeriesDetails(
      {required int tvSeiesId});
  Future<Either<Failure, List<TvEpisodeModel>>> getEpisodes(
      {required int tvId, required int seasonNumber});
  Future<Either<Failure, List<TvModel>>> getTvRecommendations(
      {required int tvId});
}
