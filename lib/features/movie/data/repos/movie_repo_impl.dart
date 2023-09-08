import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:night_movie/core/models/trailer_model.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/api_services.dart';
import '../models/movie_model/movie_model.dart';
import './movie_repo.dart';

class MovieRepoImpl implements MovieRepo {
  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlaying() async {
    try {
      var response =
          await ApiServices.get(endpoint: '/movie/now_playing?api_key=$apiKey');
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
    try {
      var response = await ApiServices.get(
          endpoint: '/movie/popular?api_key=$apiKey&page=$page');
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
    try {
      var response = await ApiServices.get(
          endpoint: '/movie/top_rated?api_key=$apiKey&page=$page');
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
    try {
      final response = await ApiServices.get(
          endpoint: '/movie/$movieId/videos?api_key=$apiKey');
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
    try {
      final response = await ApiServices.get(
          endpoint: '/movie/$movieId/recommendations?api_key=$apiKey');
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
