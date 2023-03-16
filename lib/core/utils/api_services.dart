import 'package:dio/dio.dart';
import '../constants.dart';

class ApiServices {
  static late Dio _dio;

  static void initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // used to get all movies [MovieModel], [RecommendationModel], [TvModel]
  static Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get(endpoint);
    return response.data;
  }
}
