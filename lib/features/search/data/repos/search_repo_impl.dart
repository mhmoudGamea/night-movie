import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/api_services.dart';
import '../models/search_model/search_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failure, List<SearchModel>>> getSearch({
    required String movieName,
  }) async {
    try {
      final response = await ApiServices.get(
          endpoint: '/search/movie?api_key=$apiKey&query=$movieName');
      List<SearchModel> searchedMovies = [];
      response['results'].forEach(
        (item) => {
          searchedMovies.add(
            SearchModel.fromJson(item),
          ),
        },
      );
      return right(searchedMovies);
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }
}
