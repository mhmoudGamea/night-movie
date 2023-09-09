import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/core/models/trailer_model.dart';
import 'package:night_movie/core/utils/api_services.dart';
import 'package:night_movie/features/tv/data/models/tv_detail_model.dart';
import 'package:night_movie/features/tv/data/models/tv_episodes_model.dart';

import '../../../../core/error/failure.dart';
import '../models/tv_model.dart';
import 'tv_repo.dart';

class TvRepoImpl implements TvRepo {
  @override
  Future<Either<Failure, List<TvModel>>> getOnTheAir() async {
    try {
      final response =
          await ApiServices.get(endpoint: '/tv/on_the_air?api_key=$apiKey');
      return right(TvModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getTvPopular({int page = 1}) async {
    try {
      final response = await ApiServices.get(
          endpoint: '/tv/popular?api_key=$apiKey&page=$page');
      return right(TvModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getTvTopRated({int page = 1}) async {
    try {
      final response = await ApiServices.get(
          endpoint: '/tv/top_rated?api_key=$apiKey&page=$page');
      return right(TvModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, TvDetailModel>> getTvSeriesDetails(
      {required int tvSeiesId}) async {
    try {
      final response =
          await ApiServices.get(endpoint: '/tv/$tvSeiesId?api_key=$apiKey');
      TvDetailModel tvDetailsModel = TvDetailModel.fromJson(response);
      return right(tvDetailsModel);
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TvEpisodeModel>>> getEpisodes(
      {required int tvId, required int seasonNumber}) async {
    try {
      final response = await ApiServices.get(
          endpoint: '/tv/$tvId/season/$seasonNumber?api_key=$apiKey');
      return right(TvEpisodeModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrailerModel>>> getTvTrailers(
      {required int tvId}) async {
    try {
      final response =
          await ApiServices.get(endpoint: '/tv/$tvId/videos?api_key=$apiKey');
      return right(TrailerModel.getListFromResponse(response));
    } catch (error) {
      // print(error);
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getTvRecommendations(
      {required int tvId}) async {
    try {
      final response = await ApiServices.get(
          endpoint: '/tv/$tvId/recommendations?api_key=$apiKey');
      return right(TvModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }
}
