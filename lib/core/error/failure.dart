import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerSideError extends Failure {
  ServerSideError(super.errorMessage);

  factory ServerSideError.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerSideError('Connection timed out, Please try again later');
      case DioErrorType.sendTimeout:
        return ServerSideError('Send timed out, Please try again later');
      case DioErrorType.receiveTimeout:
        return ServerSideError('Receive timed out, Please try again later');
      case DioErrorType.response:
        return ServerSideError.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerSideError('Request to api was canceled.');
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          return ServerSideError(
              'No internet connection, Please checkout your internet connection.');
        }
        return ServerSideError('UnExpected error please try again.');
      default:
        return ServerSideError(
            'Opps there was an error, Please try again later.');
    }
  }

  factory ServerSideError.fromResponse(
      int statusCode, Map<String, dynamic> json) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerSideError(json['error']['message']);
    } else if (statusCode == 404) {
      return ServerSideError('This page is not found, Please try later.');
    } else if (statusCode == 500) {
      return ServerSideError('Internal server error, Please try later.');
    } else {
      return ServerSideError(
          'Opps there was an error, Please try again later.');
    }
  }
}
