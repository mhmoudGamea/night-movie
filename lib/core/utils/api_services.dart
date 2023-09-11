import 'package:dio/dio.dart';
import 'package:night_movie/core/models/config_model.dart';
import 'service_locator.dart';

class ApiServices {
  static late Dio _dio;
  static final configModel = ServiceLocator.getIt.get<ConfigModel>();

  static void initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: configModel.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // used to get all movies [MovieModel], [RecommendationModel], [TvModel]
  static Future<Map<String, dynamic>> get(
      {required String endpoint, Map<String, dynamic>? query}) async {
    var response = await _dio.get(endpoint, queryParameters: query);
    return response.data;
  }
}
