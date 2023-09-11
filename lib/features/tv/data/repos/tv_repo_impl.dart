import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/config_model.dart';
import '../../../../core/models/trailer_model.dart';
import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/service_locator.dart';
import '../models/tv_detail_model.dart';
import '../models/tv_episodes_model.dart';
import '../models/tv_model.dart';
import './tv_repo.dart';

class TvRepoImpl implements TvRepo {
  static final _configModel = ServiceLocator.getIt.get<ConfigModel>();
  @override
  Future<Either<Failure, List<TvModel>>> getOnTheAir() async {
    try {
      var query = {'api_key': _configModel.apiKey};
      final response =
          await ApiServices.get(endpoint: '/tv/on_the_air', query: query);
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
      var query = {'api_key': _configModel.apiKey, 'page': page};
      final response =
          await ApiServices.get(endpoint: '/tv/popular', query: query);
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
      var query = {'api_key': _configModel.apiKey, 'page': page};
      final response =
          await ApiServices.get(endpoint: '/tv/top_rated', query: query);
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
      var query = {'api_key': _configModel.apiKey};
      final response =
          await ApiServices.get(endpoint: '/tv/$tvSeiesId', query: query);
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
      var query = {'api_key': _configModel.apiKey};
      final response = await ApiServices.get(
          endpoint: '/tv/$tvId/season/$seasonNumber', query: query);
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
      var query = {'api_key': _configModel.apiKey};
      final response =
          await ApiServices.get(endpoint: '/tv/$tvId/videos', query: query);
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
      var query = {'api_key': _configModel.apiKey};
      final response = await ApiServices.get(
          endpoint: '/tv/$tvId/recommendations', query: query);
      return right(TvModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }
}
