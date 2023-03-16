import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/api_services.dart';
import '../models/movie_model/movie_model.dart';
import '../models/recommendation_model/recommendation_model.dart';
import './movie_repo.dart';

class MovieRepoImpl implements MovieRepo {
  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlaying() async {
    try {
      var response =
          await ApiServices.get(endpoint: '/movie/now_playing?api_key=$apiKey');
      List<MovieModel> movieModel = [];
      response['results']
          .forEach((item) => movieModel.add(MovieModel.fromJson(item)));
      return right(movieModel);
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    try {
      var response =
          await ApiServices.get(endpoint: '/movie/popular?api_key=$apiKey');
      List<MovieModel> movieModel = [];
      response['results']
          .forEach((item) => movieModel.add(MovieModel.fromJson(item)));
      return right(movieModel);
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() async {
    try {
      var response =
          await ApiServices.get(endpoint: '/movie/top_rated?api_key=$apiKey');
      List<MovieModel> movieModel = [];
      response['results']
          .forEach((item) => movieModel.add(MovieModel.fromJson(item)));
      return right(movieModel);
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationModel>>> getRecommendationMovies(
      {required int movieId}) async {
    try {
      final response = await ApiServices.get(
          endpoint: '/movie/$movieId/recommendations?api_key=$apiKey');
      List<RecommendationModel> recommendationMovies = [];
      response['results'].forEach((item) =>
          recommendationMovies.add(RecommendationModel.fromJson(item)));
      return right(recommendationMovies);
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }
}
