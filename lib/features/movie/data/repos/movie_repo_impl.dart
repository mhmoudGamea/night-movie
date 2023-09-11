import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/config_model.dart';
import '../../../../core/models/trailer_model.dart';
import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/service_locator.dart';
import '../models/movie_model/movie_model.dart';
import './movie_repo.dart';

class MovieRepoImpl implements MovieRepo {
  static final _configModel = ServiceLocator.getIt.get<ConfigModel>();
  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlaying() async {
    try {
      var query = {'api_key': _configModel.apiKey};
      var response =
          await ApiServices.get(endpoint: '/movie/now_playing', query: query);

      return right(MovieModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies(
      {int page = 1}) async {
    var query = {'api_key': _configModel.apiKey, 'page': page};
    try {
      var response =
          await ApiServices.get(endpoint: '/movie/popular', query: query);

      return right(MovieModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies(
      {int page = 1}) async {
    var query = {'api_key': _configModel.apiKey, 'page': page};
    try {
      var response =
          await ApiServices.get(endpoint: '/movie/top_rated', query: query);

      return right(MovieModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrailerModel>>> getTrailer(
      {required int movieId}) async {
    var query = {'api_key': _configModel.apiKey};
    try {
      final response = await ApiServices.get(
          endpoint: '/movie/$movieId/videos', query: query);

      return right(TrailerModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getRecommendationMovies(
      {required int movieId}) async {
    var query = {'api_key': _configModel.apiKey};
    try {
      final response = await ApiServices.get(
          endpoint: '/movie/$movieId/recommendations', query: query);

      return right(MovieModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  // cloud firestore handling functions
  CollectionReference watchLists =
      FirebaseFirestore.instance.collection(usersWatchListsCollection);

  @override
  Future<DocumentReference<Map<String, dynamic>>> addToWatchList(
      String uId, Map<String, dynamic> json) async {
    // await watchLists.doc(uId).set('data');
    DocumentReference<Map<String, dynamic>> docId =
        await watchLists.doc(uId).collection('watchList').add(json);
    await watchLists.doc(uId).set({'dummy': 'dummy'});
    return docId;
  }
}
