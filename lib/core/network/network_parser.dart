import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../error/exception.dart';

typedef CallClientMethod = Future<Response<dynamic>> Function();

abstract class NetworkParser {
  Future<dynamic> callClientWithCatchException(CallClientMethod callClientMethod);
}
class NetworkParserImp implements NetworkParser {
  @override
  Future<dynamic> callClientWithCatchException(
      CallClientMethod callClientMethod) async {
    try {
      final response = await callClientMethod();
      return _responseParser(response);
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        throw const NetworkException('Request timeout', 408);
      } else if (error.type == DioExceptionType.badResponse) {
        throw const BadResponseException('Bad request', 400);
      } else {
        throw const NetworkException('Network error', 500);
      }
    } on SocketException {
      throw const NetworkException('No internet connection', 10061);
    }
  }

   _responseParser(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        return responseJson;
      case 401:
        throw const UnauthorisedException("Unauthorized request", 401);
      case 429:
        throw const TooManyRequestException("Too many requests", 429);
      default:
        throw FetchDataException('Error occur while communication with Server',
            response.statusCode!);
    }
  }

}
