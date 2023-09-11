import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/config_model.dart';
import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/service_locator.dart';
import '../models/search_model.dart';
import './search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  static final _configModel = ServiceLocator.getIt.get<ConfigModel>();
  @override
  Future<Either<Failure, List<SearchModel>>> getSearch({
    required String search,
  }) async {
    try {
      var query = {'api_key': _configModel.apiKey, 'query': search};
      final response =
          await ApiServices.get(endpoint: '/search/multi', query: query);

      return right(SearchModel.getListFromResponse(response));
    } catch (error) {
      if (error is DioError) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }
}
